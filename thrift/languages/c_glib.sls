{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'c_glib' in language_requirements %}
{% for c_glib_package in thrift.c_glib_requirements %}
thrift_c_glib_requirement_{{ c_glib_package }}:
  pkg.installed:
    - name: {{ c_glib_package }}
{% endfor %}
{% endif %}


