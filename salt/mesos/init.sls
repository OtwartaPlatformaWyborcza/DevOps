mesos-ppa:
  pkgrepo.managed:
    - humanname: mesosphere PPA
    - name: deb http://repos.mesosphere.io/ubuntu trusty main
    - dist: trusty
    - file: /etc/apt/sources.list.d/meso.list
    - keyid: E56151BF
    - keyserver: keyserver.ubuntu.com
