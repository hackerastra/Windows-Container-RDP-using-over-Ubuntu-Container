
#!/bin/bash
# executing helper script

vagrant_latest_version=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant  | jq -r -M '.current_version')

curl -O https://releases.hashicorp.com/vagrant/$(echo $vagrant_latest_version)/vagrant_$(echo $vagrant_latest_version)_x86_64.deb

dpkg -i vagrant_$(echo $vagrant_latest_version)_x86_64.deb
