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

**WARNING**: An `Origin` HTTP request header (ex. `Origin: https://yourcompany.com`) is not currently mandatory during the Beta period when doing a WebSocket connection to our endpoints, but expect that `Origin` header requirement will start to be enforced as we transitioned from the initial Beta phase to General Availability in the near future. As the `Origin` header becomes mandatory, it will need to match the origins you will register along with your API key identity. More details will come soon.
