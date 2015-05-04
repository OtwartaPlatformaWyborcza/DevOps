docker-ppa:
  pkgrepo.managed:
    - humanname: docker PPA
    - name: "deb https://get.docker.com/ubuntu docker main"
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - keyserver: keyserver.ubuntu.com

docker-base-pkgs:
  pkg.installed:
    - pkgs:
      - lxc-docker

/etc/default/docker:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://docker/templates/default_docker.jinja

docker:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/default/docker
