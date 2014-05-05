{% from "thrift/map.jinja" import thrift with context %}
{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if 'php' in language_requirements %}
{% for php_package in thrift.php_requirements %}
thrift_php_requirement_{{ php_package }}:
  pkg.installed:
    - name: {{ php_package }}
{% endfor %}
{% endif %}


