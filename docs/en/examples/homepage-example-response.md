```jsonc
{
    "type": "action_trace",
    "data": {
        "block_num": 14934816,
        "block_id": "00e3...6268",
        "trx_id": "e7d6...d75f",
        ...,
        "trace": {
            "receipt": { ... },
            "act": {
                "account": "eosio.token",
                "name": "transfer",
                "authorization": [
                    ...
                ],
                "data": {
                    "from": "deathstarcom",
                    "to": "11111dfuseio",
                    "quantity": "5.0000 EOS",
                    "memo": "It works!"
                }
            }
        }
    }
}
```
