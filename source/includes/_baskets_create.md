## Create
> Request JSON

```http
POST /shops/:id/baskets HTTP/1.1
Content-Type: application/json

{
  "vendor_id": 3,
  "product_ids": [1, 2, 3]
}
```

> Response JSON

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "basket": {
    "id": 1,
    "total": 11.50
  }
}
```

<aside>
<b>POST</b> <i>/shops/:id/baskets</i>
</aside>