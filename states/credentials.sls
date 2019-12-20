{%- from "vars" import vars with context %}
{% if grains['kernel'] == 'Windows' %}
    {% set source_prefix = "c:\\vagrant\\.configurations\\"%}
{% elif grains['kernel'] == 'Linux' %}
    {% set source_prefix = "/mnt/c/vagrant/.configurations/"%}
{% endif %}

Copy ~{{ vars.user }}/.aws:
  file.copy:
    - name: ~{{ vars.user }}/.aws
    - source: {{ source_prefix }}.aws
    - remove_existing: False
    - recurse: True
    # - require:
    #   - file.directory.~{{ vars.user }}/.aws

file.directory.~{{ vars.user }}/.aws:
  file.directory:
    - name: ~{{ vars.user }}/.aws
    - user: {{ vars.user}}
{% if grains['kernel'] == 'Linux' %}
    - group: {{ vars.user }}
    - mode: 700
    - recurse:
      - user
      - group
      - mode
{% endif %}

~{{ vars.user }}/.ssh/id_ed25519:
  file.copy:
    - name: ~{{ vars.user }}/.ssh/id_ed25519
    - source: {{ source_prefix }}.ssh/id_ed25519
    - remove_existing: False
    - recurse: True
    # - require:
    #   - file: ~{{ vars.user }}/.ssh