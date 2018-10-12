### `get_actions` Request

Retrieve a stream of actions, filtered by `receiver` and `account`

```json
{"type": "get_actions",
 "listen": true,
 "data": {
    "account": "eosio.token",
    "action_name": "transfer",
 }}
```

`data` fields:
  * `account` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Contract account targeted by the action.
  * `receiver` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)?** Specify the receiving account executing its smart contract. If left blank, defaults to the same value as `account`.
  * `action_name` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)?** Name of the action called within the `account` contract.
  * `with_db_ops` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Stream changes to the database tables produced by each action.
  * `with_ram_costs` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Stream RAM billing changes and reasons for costs of storage produced by each action.
  * `with_inline_traces` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Stream the inline actions produced by each action.
  * `with_deferred` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Stream the modifications to deferred transactions produced by each action.


### `get_transaction` Request

Retrieve a transaction and follow its life-cycle. BETA: some life-cycle events are still being rolled out.

```json
{"type": "get_transaction", "data": {"id": "abcdef123123123..."}}
```

`data` fields:
* `id` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** The transaction ID you're looking to track.


### `get_table_rows` Request

Retrieve a stream of changes to the tables, as a side effect of
transactions/actions being executed.

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
  * `code`  **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Contract account which wrote to tables.
  * `scope`  **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)**  Table _scope_ where table is stored.
  * `table_name`  **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)**  Table _name_, shown in the contract ABI.
  * `json` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** With `json=true` (or `1`), table rows will be decoded to JSON, using the ABIs active on the queried block. This endpoint will thus automatically adapt to upgrades to the ABIs on chain.
  * `verbose` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)? Return the `code`, `table_name`, `scope` and `key` alongside each row.


### `unlisten` Request

To interrupt a stream, you can `unlisten` with the original `req_id` like this:

```json
{"type": "unlisten", "data": {"req_id": "original-request-id"}}
```

`data` fields:
  * `req_id` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** The `req_id` passed to previous commands which included `listen=true`.
