#!/bin/sh
mkdir -p metrics

tee -a ~/metrics/inventory.yml << EOF
all:
  children:
    servers:
      hosts:
        rhel2:
        rhel3:
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

tee -a ~/metrics/metrics.yml << EOF
- name: Use metrics system role to configure PCP metrics recording
  hosts: servers
  roles:
    - redhat.rhel_system_roles.metrics

- name: Use metrics system role to configure Grafana
  hosts: metrics_monitor
  roles:
    - redhat.rhel_system_roles.metrics
EOF

cd metrics
ansible-playbook metrics.yml -b -i inventory.yml
