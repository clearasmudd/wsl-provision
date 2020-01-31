{%- from "vars" import vars with context %}
# npm:
#   pkg.installed
# https://github.com/conventional-changelog/commitlint#getting-started
# https://commitlint.js.org/#/guides-local-setup

file.directory.~{{ vars.user }}/install.npm:
  file.directory:
    - name: ~{{ vars.user }}/install.npm
    - user: {{ vars.user}}
{% if grains['kernel'] == 'Linux' %}
    - group: {{ vars.user }}
    - mode: 700
    - recurse:
      - user
      - group
      - mode
{% endif %}

# install.npm:
#   npm.bootstrap:
#     - user: {{ vars.user }}

# npm install --save-dev @commitlint/{cli,config-conventional}
@commitlint/{config-conventional,cli}:
  npm.installed:
    - user: {{ vars.user }}

# npm install husky --save-dev
husky:
  npm.installed:
    - user: {{ vars.user }}
  