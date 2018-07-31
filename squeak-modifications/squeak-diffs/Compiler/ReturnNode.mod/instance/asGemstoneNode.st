translating
asGemstoneNode
  | gsReturnNode |
  gsReturnNode := (GemstoneSmalltalk _env0 at: #GsComReturnNode) _env0 newSmalltalk.
  ^ gsReturnNode _env0 return: self expr asGemstoneNode
