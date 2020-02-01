{%- from "vars" import vars with context %}
# npm:
#   pkg.installed
# https://github.com/conventional-changelog/commitlint#getting-started
# https://commitlint.js.org/#/guides-local-setup
# https://commitlint.js.org/#/guides-use-prompt?id=provide-a-shortcut

# curl -sL https://deb.nodesource.com/setup_12.x — Node.js 12 LTS "Erbium" | sudo -E bash -
# sudo apt-get install -y nodejs
# sudo /bin/rm -r ~/.npm
# npm install --save-dev @commitlint/{cli,config-conventional}
# npm install --save-dev husky
# package.json
# {
#    "name": "windows-formula",
#    "version": "1.0.0",
#    "description": "",
#    "main": "",
#    "directories": {
#      "doc": "docs",
#      "test": "test"
#    },
#    "scripts": {
#      "test": "echo \"Error: no test specified\" && exit 1"
#    },
#    "repository": {
#      "type": "git",
#      "url": "git+https://github.com/clearasmudd/windows-formula.git"
#    },
#    "author": "",
#    "license": "ISC",
#    "bugs": {
#      "url": "https://github.com/clearasmudd/windows-formula/issues"
#    },
#    "homepage": "https://github.com/clearasmudd/windows-formula#readme",
#    "devDependencies": {
#      "@commitlint/cli": "^8.3.5",
#      "@commitlint/config-conventional": "^8.3.4",
#      "husky": "^4.2.1"
#    }
#  }

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
  