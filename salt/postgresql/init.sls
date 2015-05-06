postgres-ppa:
  pkgrepo.managed:
    - humanname: postgres PPA
    - name: deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
    - dist: trusty
    - file: /etc/apt/sources.list.d/postgresql.list
    - keyid: ACCC4CF8
    - keyserver: keyserver.ubuntu.com

postgres-pkgs:
  pkg.installed:
    - pkgs:
      - postgresql-9.4
      - postgresql-contrib
