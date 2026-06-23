#!/bin/sh
tee ~/metrics/inventory.yml << EOF
all:
  children:
    servers:
      hosts:
        rhel2:
        rhel3:
        rhel4:
      vars:
        metrics_retention_days: 7
        metrics_manage_firewall: true
        metrics_manage_selinux: true
    metrics_monitor:
      hosts:
        rhel:
      vars:
        metrics_graph_service: yes
        metrics_query_service: yes
        metrics_retention_days: 7
        metrics_monitored_hosts:  "{{ groups['servers'] }}"
        metrics_manage_firewall: true
        metrics_manage_selinux: true
EOF

ansible-playbook ~/metrics/metrics.yml -b -i ~/metrics/inventory.yml
