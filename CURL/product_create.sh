#!/bin/sh
curl -XPOST -H 'Accept: application/json' -H 'Content-Type: application/json' http://localhost:3000/shops/$1/products -d '{ "product": { "name": "SHOP NAME", "description": "SHOP DESCRIPTION", "shop_id": 1, "quantity": 10, "price": 14 } }'
