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

**注意**: 在 Beta 期间，与我们的端点建立 WebSocket 连接的，`Origin` HTTP请求标头
（例如 `Origin: https://yourcompany.com`）还不是必需的，但是请了解，
当我们在不久的将来，从最初的 Beta 阶段过渡到通用性版本时，我们会要求您使用 `Origin` 标头 。 
到那时候，您的 `Origin` 标头将需要与您注册API密钥身份的源头相匹配。 更多具体细节即将推出。
