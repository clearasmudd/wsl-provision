#!/usr/bin/env bash
#exec salt-call --local --file-root=./states state.highstate
#exec sudo salt-call --local --file-root=/mnt/c/vagrant/github/clearasmudd/wsl-provision/states/ state.highstate
exec salt-call --local --file-root=./states/ state.highstate
