{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'perl' in language_requirements %}
{% for perl_package in thrift.perl_requirements %}
thrift_perl_requirement_{{ perl_package }}:
  pkg.installed:
    - name: {{ perl_package }}
{% endfor %}
{% endif %}


