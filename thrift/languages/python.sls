{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'python' in language_requirements %}
{% for python_package in thrift.python_requirements %}
thrift_python_requirement_{{ python_package }}:
  pkg.installed:
    - name: {{ python_package }}
{% endfor %}
{% endif %}


