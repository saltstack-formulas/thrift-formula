{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'erlang' in language_requirements %}
{% for erlang_package in thrift.erlang_requirements %}
thrift_erlang_requirement_{{ erlang_package }}:
  pkg.installed:
    - name: {{ erlang_package }}
{% endfor %}
{% endif %}


