{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'csharp' in language_requirements %}
{% for csharp_package in thrift.csharp_requirements %}
thrift_csharp_requirement_{{ csharp_package }}:
  pkg.installed:
    - name: {{ csharp_package }}
{% endfor %}
{% endif %}


