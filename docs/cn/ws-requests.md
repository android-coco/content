### `get_actions` 请求

检索一个操作流，由 `receiver` 和 `account` 过滤

```json
{"type": "get_actions",
 "listen": true,
 "data": {
    "account": "eosio.token",
    "action_name": "transfer",
 }}
```

`data` 字段：

  * `account` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 该操作所针对的合约帐户。
  * `receiver` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)?** 指定执行其智能合约的接收者帐户。如果留空，则默认为与 `account`相同的值。
  * `action_name` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)?** 在 `account` 合约中所调用的操作的名称。
  * `with_db_ops` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 流式读取每个操作生成的数据库表改动。
  * `with_ram_costs` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 流式读取RAM计费更改和每个操作所产生的存储成本的原因。
  * `with_inline_traces` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 流式读取每个操作产生的内联操作。
  * `with_deferred` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 
流式读取每个操作生成的延迟交易的更变。


### `get_transaction` 请求

检索交易并跟踪其生命周期。BETA：某些生命周期事件仍在产生过程中。

```json
{"type": "get_transaction", "data": {"id": "abcdef123123123..."}}
```

`data` 字段：

  * `id` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 你想要跟踪的交易ID。


### `get_table_rows` 请求

流式检索因正在执行的交易/操作所产生的表的更改。

```json
{"type": "get_table_rows",
 "req_id": "123",
 "listen": true,
 "data": {
   "code": "eosio.token",
   "scope": "eoscanadacom",
   "table_name": "accounts",
   "json": true,
   "verbose": true
 }
}
```

`data` fields:

  * `code`  **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 向表格中写入过的合约帐户。
  * `scope`  **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 存储表的_scope_表。
  * `table_name`  **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)**  _name_表，显示在合同ABI中。
  * `json` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 有了 `json = true`（或`1`），使用所查询的区块上活跃的ABI，表行将被解码为JSON。 因此，该端点将自动适应链上ABI的升级。
   * `verbose` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)? 沿着每一行反馈 `code`， `table_name`， `scope` 和 `key` 。


### `unlisten` 请求

要中断流读取，你可以用原始的 `req_id` 来 `unlisten`，就像这样：

```json
{"type": "unlisten", "data": {"req_id": "original-request-id"}}
```

`data` 字段：

  * `req_id` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 传递给之前的命令的`req_id`，其中包括`listen = true`。
