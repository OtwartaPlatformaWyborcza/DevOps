/etc/iptables/rules.v4:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://net/files/master.iptables.v4

/root/fw.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - template: jinja
    - source: salt://net/files/clear_fw.sh
