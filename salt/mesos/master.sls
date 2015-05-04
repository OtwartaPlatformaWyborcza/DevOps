mesos-master-pkgs:
  pkg.installed:
    - pkgs:
      - mesosphere

/etc/mesos/zk:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://mesos/templates/mesos_zk.jinja

/etc/zookeeper/conf/myid:
  file.managed:
    - makedirs: true
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - contents: "{{ pillar['mesos']['my_id'] }}"

/var/lib/zookeeper:
  file.directory:
    - user: zookeeper
    - group: zookeeper

/var/lib/zookeeper/myid:
  file.symlink:
      - target: /etc/zookeeper/conf/myid

/etc/zookeeper/conf/zoo.cfg:
  file.managed:
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - template: jinja
    - makedirs: true
    - source: salt://mesos/templates/zk_zoo.jinja

/etc/zookeeper/conf/environment:
  file.managed:
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - template: jinja
    - makedirs: true
    - source: salt://mesos/templates/zk_env.jinja

/etc/zookeeper/conf/log4j.properties:
  file.managed:
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - template: jinja
    - makedirs: true
    - source: salt://mesos/templates/zk_log4j.jinja

{% for option, value in pillar['mesos']['master_opts'].items() %}
/etc/mesos-master/{{ option }}:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: {{ value }}
    - listen_in:
      - service: mesos-master
{% endfor %}

/etc/mesos-master/ip:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "{{ pillar['net']['eth1']['ip'] }}"
    - listen_in:
      - service: mesos-master

/etc/mesos-master/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "{{ pillar['net']['eth1']['ip'] }}"
    - listen_in:
      - service: mesos-master

/etc/marathon/conf/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: "{{ pillar['net']['eth1']['ip'] }}"
    - listen_in:
      - service: marathon

/etc/marathon/conf/zk:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - template: jinja
    - source: salt://mesos/templates/mesos_marathon.jinja
    - listen_in:
      - service: marathon

/etc/marathon/conf/event_subscriber:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - contents: 'http_callback'
    - listen_in:
      - service: marathon

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

/etc/mesos-slave/resources:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: "cpus(*):1; mem(*):2048"
    - listen_in:
      - service: mesos-slave

mesos-slave:
  service.running:
    - enable: True
    - reload: True

mesos-master:
  service.running:
    - enable: True
    - reload: True
    - require:
      - service: zookeeper

marathon:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/marathon/conf/hostname
      - file: /etc/marathon/conf/zk

zookeeper:
  service.running:
    - enable: True
    - watch:
      - file: /etc/zookeeper/conf/zoo.cfg
      - file: /etc/zookeeper/conf/myid


