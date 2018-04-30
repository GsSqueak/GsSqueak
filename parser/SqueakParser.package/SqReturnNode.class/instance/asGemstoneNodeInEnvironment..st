translating
asGemstoneNodeInEnvironment: env
  | GsReturnNode |
  GsReturnNode := GsComReturnNode new.
  ^ GsReturnNode return: (self expr asGemstoneNodeInEnvironment: env)
