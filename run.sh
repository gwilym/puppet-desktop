#!/bin/bash

export FACTER_USER="${USER}"
export FACTER_HOME="${HOME}"

sudo -E puppet apply --modulepath='./modules:./modules-git' --hiera_config=hiera/hiera.yaml manifests/desktop.pp
