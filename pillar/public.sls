docker:
  insecure_registry: docker.otwpw.pl

mesos:
  masters:
    - 10.13.12.11
    - 10.13.12.12
    - 10.13.12.13
  client_port: 2181
  quorum_port: 2888
  election_port: 3888
  master_opts:
    quorum: '2'
    cluster: opw
  slave_opts:
    containerizers: 'docker,mesos'
    executor_registration_timeout: '5mins'
    executor_shutdown_grace_period: '10secs'
    docker_stop_timeout: '12secs'
