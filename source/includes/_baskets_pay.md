## Pay
> Request JSON

```http
POST /baskets/:basket_id/pay HTTP/1.1
Content-Type: application/json

{
  "to_be_defined": null
}
```

> Response JSON

```http
HTTP/1.1 200 Ok
Content-Type: application/json

{
  "basket": {
    "status": "payed"
  }
}
```

<aside>
<b>POST</b> <i>/baskets/:basket_id/pay</i>
</aside>