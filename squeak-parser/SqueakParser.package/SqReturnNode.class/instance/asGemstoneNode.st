translating
asGemstoneNode
  | GsReturnNode |
  GsReturnNode := GsComReturnNode newSmalltalk.
  ^ GsReturnNode return: self expr asGemstoneNode