#!/bin/sh
curl -XPOST -H 'Accept: application/json' -H 'Content-Type: application/json' http://localhost:3000/events/$1/shops -d '{ "shop": { "name": "SHOP NAME", "description": "SHOP DESCRIPTION", "owner_id": 1 } }'
