#!/bin/bash

timedatectl set-timezone America/Vancouver

# subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
# dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
dnf -y install stress
