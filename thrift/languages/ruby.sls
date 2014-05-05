{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'ruby' in language_requirements %}
{% for ruby_package in thrift.ruby_requirements %}
thrift_ruby_requirement_{{ ruby_package }}:
  pkg.installed:
    - name: {{ ruby_package }}
{% endfor %}
{% endif %}


