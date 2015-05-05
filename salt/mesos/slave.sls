mesos-slave-pkgs:
  pkg.installed:
    - pkgs:
      - mesos

zookeeper:
  service.dead:
    - enable: false

/etc/mesos/zk:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://mesos/templates/mesos_zk.jinja

/etc/init/zookeeper.override:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: 'manual'

/etc/init/mesos-master.override:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: 'manual'

{% for option, value in pillar['mesos']['slave_opts'].items() %}
/etc/mesos-slave/{{ option }}:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: {{ value }}
    - listen_in:
      - service: mesos-slave
{% endfor %}

/etc/mesos-slave/ip:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "{{ pillar['net']['eth1']['ip'] }}"
    - listen_in:
      - service: mesos-slave

/etc/mesos-slave/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "{{ pillar['net']['eth1']['ip'] }}"
    - listen_in:
      - service: mesos-slave

mesos-master:
  service.dead:
    - enable: False

mesos-slave:
  service.running:
    - enable: True
    - reload: True


