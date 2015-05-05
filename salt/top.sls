base:
  '*':
    - base
  'E@master*':
    - mesos
    - mesos.master
    - docker
    - net
    - haproxy
    - bamboo
  'E@slave*':
    - mesos
    - mesos.slave
    - docker
    - haproxy
    - bamboo
