curl -X PUT -v -H 'Content-Type: application/json' -H "Authorization: Token token=$1" localhost:3000/users/$2 -d '{"user": { "firstname": "UPDATE" } }'