curl -X POST -H 'Content-Type: application/json' localhost:3000/users/auth -d '{"email": "'$1'", "password": "'$2'"}'