curl -X POST -H 'Content-Type: application/json' localhost:3000/users/register -d '{"email": "'$1'", "password": "'$2'"}'