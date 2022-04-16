#!/bin/bash

set -eu

# API token can be obtained at https://simplecloud.ru/cpanel/#/profile
# It is invalidated after 30 minutes.
API_TOKEN="$1"
# `VPS_ID` is displayed to the right of your VPS name at https://simplecloud.ru/cpanel
VPS_ID="$2"


# `373` is ID of Ubuntu 20.04 image
curl \
  --request POST \
  --header "content-type: application/json" \
  --header "Authorization: Bearer $API_TOKEN" \
  --data '{"type":"rebuild","image":"373"}' \
  --url "https://api.simplecloud.ru/v3/vps/$VPS_ID/actions"
  
echo
