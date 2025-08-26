#!/bin/bash

timedatectl set-timezone America/Vancouver

tee -a /root/.ssh/config << EOF
Host *
    StrictHostKeyChecking no
EOF

chmod 400 /root/.ssh/config