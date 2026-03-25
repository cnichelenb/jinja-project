{% set my_cool_string = 'wow! cool!' %}
{% set my_second_cool_string = 'this is jinja!' %}
{% set my_cool_number = 100 %}

{{ my_cool_string }} {{ my_second_cool_string }} I want to write Jinja for {{ my_cool_number }}

{% set my_animals = ['lemur', 'wolf', 'panther', 'tardigrade'] %}
{{ my_animals[0] }}
{{ my_animals[1] }}
{{ my_animals[2] }}
{{ my_animals[3] }}

{% for animal in my_animals %}
My favorite animal is the {{ animal }}
{% endfor %}
