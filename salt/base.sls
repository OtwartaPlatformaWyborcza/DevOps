base-pkgs:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - curl
      - htop
      - iotop
      - iptables-persistent
      - tmux
      - fail2ban
      - mc
      - nano

sshkeys:
  ssh_auth.present:
    - user: root
    - comment: operations
    - names:
      - ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA0J+cYy52FGgngXHJ0dtymgwhsKjtO0OhbOPy6SQlsQUGaOc+yYFcKnQmg/RgCzNexhHNJB7BHv+h8oG+ctqlFML6hmHqM4vG6bDE7Dx5vvR+grMW2VffaRRDhqQsEzCh8LISScQEjCfrcQV1qQ3KOyAwb+oOi9hsOsiw9Qb6cDWZJ8LX0FStRVSklDaKveOOsf2XpWs4M0zQmNX9Z6QzF8ABVP5EF6NKkCcoeOR60DclyfOLilnwZi9MsTCiAw+2jVEImjgJkPYiDh6cZhA1dc9+nZqNG6HrSsKE2GQDbl/RRnPHsOd78lQpJ4cJ1tPKR1988byFx0pVvX6Z5ULrT82WPhGn0eBcsIgsw8wmwdE2GwWYTO4KCghP0y+cBQ3ccJNNCMLsVoI08+VX3cfG5pIMn1hL/J/NV4eqmDrTyR2Ao/d5OCOoEEXTZHr4ffRFnyImu5gn0WlrNGSyNNtJBg3xszcMbHnXu5NwPcJkM5LeVkn6wButGk0gP55COPGeH5CI5nUqDQOCmabLtCJ0gyYo3tjs0xs4ohoQyYHaqHU5876xhLolNjc2JFMMZKgoCITzMKOuMqtAguZyNF41RbM5WdWQ6HS8An+QMbBR8lUoG+wzkWI4aUucnTgNQoesfObzMRg/EsNjy71mxl0gp0RNAjYrR432/qUL5S5xAOE= adam@adam-desktop
      - ssh-dss AAAAB3NzaC1kc3MAAACBAOjQv2904eVeTWtnhhQHJ7/oBP8v2ateqM/U0D7x6BoceStCliEnPI0PH12SCMmvZrsq98IWyEopMsNinTiOGJKW535Uua6U2n5t7sSJW26RWI7l3Arp5l1f7ZxVP8ZVU6LbfQijAbwJIaPcSmfKkdPmcL+aV84HueVXhfUuw3lXAAAAFQCcaGGnF43u5WHfh9I6uDCL+Dk8hQAAAIEAgy7fggshGbs6KQo7gm5RHab4UqhUI8mc+wkeRViRrtdlJuplKlOR4oOk+uVmELDpCLXi0i+qRogY3JhFQCMG/mckLVL8oQ5ogy2St5+5CtI2MiLZJka4RMv8lT6nRBJbq1Z0NpNuMBRVwyKc33k1idRSN0G4D6eUl+QpRSnpLuMAAACAPaeXpzDgfqPJ4gnF4TLoLH1jYFeF2q4dNLr8WlNhgtDwdDhTSTr7J2W2bSRsItNTD68QEgd11TSbdc+Q/+w3v7/6qQOcXZXHgdfnkp8YGPRyBIoE6feREaWDUzK67AQQJW5LITKjTAEmid65K5eE1jn17RFCidWc7vOQA06NplA= maciek@box
