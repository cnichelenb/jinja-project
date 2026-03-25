{% set jennas_dictionary = {
  'word' : 'gene',
  'part_of_speech' : 'noun',
  'definition' : 'the building block of life'
} %}

{{ jennas_dictionary['word'] }}

{{ jennas_dictionary['word'] }} ({{ jennas_dictionary['part_of_speech'] }}): defined as "{{ jennas_dictionary['definition'] }}"