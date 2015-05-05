haproxy-ppa:
  pkgrepo.managed:
    - humanname: haproxy PPA
    - name: deb http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu trusty main
    - file: /etc/apt/sources.list.d/haproxy.list
    - keyid: 1C61B9CD
    - keyserver: keyserver.ubuntu.com

haproxy-pkgs:
  pkg.installed:
    - pkgs:
      - haproxy

/etc/default/haproxy:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "ENABLED=1"

haproxy:
  service.running:
    - enable: True
    - reload: True


