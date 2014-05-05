{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'haskell' in language_requirements %}
{% for haskell_package in thrift.haskell_requirements %}
thrift_haskell_requirement_{{ haskell_package }}:
  pkg.installed:
    - name: {{ haskell_package }}
{% endfor %}
{% endif %}


