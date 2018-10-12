第一步, 获取免费的 API 密钥 (一个JWT).

* Websocket：把你的代币作为一个叫 `token` 的_查询参数_发出  。 例子:

```
ws wss://mainnet.eos.dfuse.io/v1/stream?token=eyJ..YOURTOKENHERE...
```

* REST: 在 `Authorization` 标头里发出你的代币，作为一个 _Bearer_。例子：

```
GET /v1/table_snapshot
Host: api.mainnet.eos.dfuse.io
Authorization: Bearer eyJ..YOURTOKENHERE...
```

**注意**: 你需要使用 `Origin` 标头来做 websockets 连接
  到我们的端点.
