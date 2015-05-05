/root/bamboo_1.0.0-1_all.deb:
  file.managed:
    - source: salt://mesos/files/bamboo_1.0.0-1_all.deb
    - user: root
    - group: root
    - mode: 644
    - order: 1

install-bamboo:
  cmd.run:
    - name: 'dpkg -i /root/bamboo_1.0.0-1_all.deb'
    - unless: 'dpkg -l | grep bamboo'
    - require:
      - file: /root/bamboo_1.0.0-1_all.deb

/var/bamboo/production.json:
  file.managed:
    - source: salt://mesos/files/production.json
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/var/bamboo/haproxy_template.cfg:
  file.managed:
    - source: salt://mesos/files/haproxy_template.cfg
    - user: root
    - group: root
    - mode: 644

bamboo-server:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /var/bamboo/production.json
      - file: /var/bamboo/haproxy_template.cfg
