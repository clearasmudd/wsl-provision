# ruby-full:
#   pkg.installed

build-essential:
  pkg.installed

libgmp-dev:
  pkg.installed

install_chefdk:
  pkg.installed:
    - sources:
      - chefdk: https://packages.chef.io/files/stable/chefdk/4.6.35/ubuntu/18.04/chefdk_4.6.35-1_amd64.deb
    - unless: apt list --installed | grep chefdk

mypackage:
  cmd.run:
    - name: sudo dpkg -i /tmp/vagrant_2.2.5_x86_64.deb
    - unless: dpkg -s vagrant
    - require:
      - /tmp/vagrant_2.2.5_x86_64.deb

/tmp/vagrant_2.2.5_x86_64.deb:
  cmd.run:
    - name: wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb -O /tmp/vagrant_2.2.5_x86_64.deb
    - creates: /tmp/vagrant_2.2.5_x86_64.deb