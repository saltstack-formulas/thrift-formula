{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'windows' in language_requirements %}
{% for windows_package in thrift.windows_requirements %}
thrift_windows_requirement_{{ windows_package }}:
  pkg.installed:
    - name: {{ windows_package }}
{% endfor %}
{% endif %}


