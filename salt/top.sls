base:
  '*':
    - base
  'E@master*':
    - mesos
    - mesos.master
    - docker
    - net
  'E@slave*':
    - mesos
    - docker
