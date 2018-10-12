所有的请求都是使用这些参数的，其中`type`是请求的类型，`req_id`是之后命令引用的代币
（客户端或服务器）。

```
{"type": "[REQUEST_NAME]"`,
 "req_id": "some-string-of-your-choosing",
 ...
}
```

这些参数可用于大多数命令（除非另有说明）：

* `type` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)** 消息的类型。请见下面的[请求](#requests)。
* `req_id` **[string](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)?** 你要发送给自己的ID，以获取与此请求相关的任何回复。
* `start_block` **[number](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Number)?** 要启动处理的区块。它可以是一个绝对值区块号，或者是一个负数值。负数值是代表链上当前区块之前的第几个区块，比如： `-2500` 的意思是当前区块的以前的第2500个区块 
* `fetch` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 获取所请求实体的初始快照。
* `listen` **[boolean](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)?** 侦听所请求实体的更改。
* `data` **[object](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object)** 一个自由形式的对象，取决于请求的 `type`。 见下文。
* `with_progress` **[number](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Number)?** 区块处理进度的频率（在 `req_id` 的范围内）。你将最多每250毫秒收到 _1个_ 通知（在区块处理量大和`blockNum％frequency == 0`的情况下）。当你收到与一个流有关的进度通知时（由其 `req_id` 所标识），它保证你会看到那个流所产出（在之前的 `progress` 通知和收到的通知之间）的所有消息。
