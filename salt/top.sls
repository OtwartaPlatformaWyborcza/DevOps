base:
  '*':
    - base
  'E@master*':
    - mesos
    - mesos.master
    - docker
    - net
    - mesos.haproxy
    - mesos.bamboo
  'E@slave*':
    - mesos
    - mesos.slave
    - docker
    - mesos.haproxy
    - mesos.bamboo
  'baza*':
    - postgresql
