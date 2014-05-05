{% set language_requirements = salt['pillar.get']('thrift:language_requirements', None) %}

{% if salt['grains.get']('os_family') == 'Debian' %}

include:
  - .python
  - .ruby
  - .perl
  - .php
  - .c_glib
  - .erlang
  - .csharp
  - .haskell
  - .windows

{% endif %}

