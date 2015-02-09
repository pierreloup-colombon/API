# Authentication

When successfully registered or logged-in, the server will provide some informations in the response header.

| Parameter    | Description      | Example |
|:------------:|:----------------:|:--------|
| access_token | Token to identified the user. | 6nwOYtNyKYYcDBUsvlThNw |
| client       | String to identifying the request. | APVqtK9VEqg10GwOHMKlxw |
| expiry       | The token expiration (the client __WILL NOT__ expire. | 19673829 |
| uid          | The token unique identifier |  <ul><li>foo@bar.com (for email registration)</li><li>23894012 (for Facebook Registration)</li></ul> |

To interact with the API, you will need to specify those headers.

> CURL Example

```shell
curl -XPOST localhost:3000/users/1/follow/2
    -H 'Content-Type: application/json'
    -H 'access-token: 6nwOYtNyKYYcDBUsvlThNw'
    -H 'client: APVqtK9VEqg10GwOHMKlxw'
    -H "uid: kiel_flatley@schulist.net"
```
