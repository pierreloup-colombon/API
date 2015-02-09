## With Email

> Request JSON

```http
POST /users/auth/sign_in HTTP/1.1
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
<b>POST</b> <i>/users/auth/sign_in</i>
</aside>

## With Facebook

> Request JSON

```http
GET /auth/facebook_access_token/callback HTTP/1.1
Content-Type: application/json

{
  "access_token": "azoepazeqsd"
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