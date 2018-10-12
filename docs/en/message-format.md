All requests are formed with these parameters, where `type` is the
type of the request, and `req_id` is a token referred to by future
commands (client or server).

```
{"type": "[REQUEST_NAME]"`,
 "req_id": "some-string-of-your-choosing",
 ...
}
```

These parameters are available for most commands (unless otherwise noted):

* `type` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** The type of the message. See [Requests](#requests) below.
* `req_id` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)?** An ID that you want sent back to you for any responses related to this request.
* `start_block` **[number](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Number)?** Block at which you want to start processing.  It can be an absolute block number, or a negative value, meaning how many blocks from the current head block on the chain. Ex: `-2500` means 2500 blocks in the past, relative to the head block.
* `fetch` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Whether to fetch an initial snapshot of the requested entity.
* `listen` **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** Whether to start listening on changes to the requested entity.
* `data` **[object](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object)** A free-form object, specific to the `type` of request. See below.
* `with_progress` **[number](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Number)?** Frequency of the progress of blocks processing (within the scope of a `req_id`). You will, at a maximum, receive _one_ notification each 250 milliseconds (when processing large amounts of blocks), and when `blockNum % frequency == 0`. When you receive a progress notification associated with a stream (again, identified by its `req_id`), you are guaranteed to have seen all messages produced by that stream, between the previous `progress` notification and the one received (inclusively).
