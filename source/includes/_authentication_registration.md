## With Email

> Request JSON

```http
POST /users/auth HTTP/1.1
Content-Type: application/json

{
	"email": "foo@bar.com",
	"password": "aze"
}
```

> Response JSON

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "user": {
    "id": 1,
    "email": "foo@bar.com"
  }
}
```

<aside>
<b>POST</b> <i>/users/auth</i>
</aside>

## With Facebook

> Request JSON

```http
GET /auth/facebook_access_token/callback HTTP/1.1
Content-Type: application/json

{
	"acess_token": "azeaze"
}
```

> Response JSON

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "user": {
    "id": 1,
    "email": "foo@bar.com"
  }
}
```
<aside>
<b>POST</b> <i>/users/auth/facebook/callback</i>
</aside>