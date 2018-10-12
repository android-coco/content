这个基于 Websockets 的 API 融合了批处理和 streaming （流/实时反馈）
能力，为你提供一个可靠性高的端点。

大多数操作都可以获取初始状态（使用`fetch = true`），然后流式读取
后续的更改（使用`listen = true`）。
