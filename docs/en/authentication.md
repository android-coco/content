First, get a Free API Key (a JWT).

* Websocket: pass the token as a _query parameter_ named `token`. Example:

```
ws wss://mainnet.eos.dfuse.io/v1/stream?token=eyJ..YOURTOKENHERE...
```

* REST: pass your token in the `Authorization` header, as a _Bearer_. Example:

```
GET /v1/table_snapshot
Host: api.mainnet.eos.dfuse.io
Authorization: Bearer eyJ..YOURTOKENHERE...
```

**WARN**: An `Origin` header is required when doing a websockets
  connection to our endpoints.
