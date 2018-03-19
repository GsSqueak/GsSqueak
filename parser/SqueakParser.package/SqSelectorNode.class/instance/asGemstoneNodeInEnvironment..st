translating
asGemstoneNodeInEnvironment: env
  | gsSelectorNode |
  gsSelectorNode := GsComSelectorLeaf newSelector: self key env: env.
  ^ gsSelectorNode