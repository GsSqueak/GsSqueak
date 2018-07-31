translating
asGemstoneNodeInEnvironment: env
  | gsSelectorNode |
  gsSelectorNode := (GemstoneSmalltalk _env0 at: #GsComSelectorLeaf) _env0 newSelector: self key env: env.
  ^ gsSelectorNode
