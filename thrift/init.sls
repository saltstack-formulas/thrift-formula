{% from "thrift/map.jinja" import thrift with context %}

{% if salt['grains.get']('os_family') == 'Debian' %}

include:
  - thrift.languages

{% endif %}

{% for package in thrift.build_requirements %}
thrift_requirement_{{ package }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %}

thrift_package:
  file.managed:
    - name: /tmp/thrift.tar.gz
    - user: {{ thrift.service_account }}
    - group: {{ thrift.service_account }}
    - mode: 644
    - source: {{ thrift.thrift_tar_url }}
    - source_hash: {{ thrift.thrift_md5 }}
    - onlyif: $(which thrift)
  cmd.wait:
    - name: tar -xf /tmp/thrift.tar.gz
    - user: {{ thrift.service_account }}
    - group: {{ thrift.service_account }}
    - cwd: /tmp
    - watch:
      - file: /tmp/thrift.tar.gz

thrift_configure:
  cmd.wait:
    - name: ./configure --without-tests
    - cwd: /tmp/{{ thrift.thrift_version }}
    - user: {{  thrift.service_account }}
    - group: {{ thrift.service_account }}
    - watch:
      - file: /tmp/thrift.tar.gz

thrift_build:
  cmd.wait:
    - name: make
    - cwd: /tmp/{{ thrift.thrift_version }}
    - user: {{ thrift.service_account }}
    - group: {{ thrift.service_account }}
    - watch:
      - cmd: thrift_configure

thrift_install:
  cmd.wait:
    - name: make install
    - cwd: /tmp/{{ thrift.thrift_version }}
    - user: root
    - group: root
    - watch:
      - cmd: thrift_build
