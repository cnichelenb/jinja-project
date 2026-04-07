-- let's develop a macro that
-- queries the information schema of a database
-- finds objects that are > 1 week old (no longer maintained)
-- generates automated drop statements
-- has the ability to execute those drop statements

{% macro clean_stale_models(database=target.database, schema=target.schema, days=7, dry_run=True) %}

    {% set get_drop_commands_query %}
        select
            case when table_type = 'VIEW' THEN table_type ELSE 'TABLE' end as drop_type,
            'DROP ' || drop_type || ' {{ database | upper }}.{{ table_schema }}.{{ table_name }}' || ';' as drop_query
        from {{ database }}.information_schema.tables
        where table_schema = upper('{{ schema }}')
        and date(last_altered) <= date(current_date - {{ days }})
    {% endset %}

    {{ log('Generating cleanup queries...\n', info=True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}

    {% for query in drop_queries %}
        {% if dry_run %}
            {{ log(query, info=True) }}
        {% else %}
            {{ log('Dropping object with command: ' ~ query, info=True) }}
            {% do run_query(query) %}
        {% endif %}
    {% endfor %}

{% endmacro %}

