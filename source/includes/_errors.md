# Errors

> 400 (Bad request)

```http
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
    "reason": "......."
}
```

> 401 (Forbidden)

```http
HTTP/1.1 401 Forbidden
Content-Type: application/json

{
    "reason": "......."
}
```

> 200 (OK) with errors (only known=documented user codes)
<br />
> `special meaning`

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
	"data": null,
	"errors": {
		"error_email_taken": ["email is already taken"]
	}
}
```

> `refers to username with server side error reason (to show to the user)`

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
	"data": null,
	"errors": {
		"error_username": ["use numbers and letters", "too short"]
	}
}
```

> 401 (Unauthorized)

```http
HTTP/1.1 401 Unauthorized
Content-Type: application/json

{
	"errors": {
		"error_session": ["not logged in"],
		"error_session_expired":[]
		"error_not_authorized":[]
	}
}
```