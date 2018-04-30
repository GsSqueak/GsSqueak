translating
asGemstoneNodeInEnvironment: env
  | GsReturnNode |
  GsReturnNode := GsComReturnNode new.
  ^ GsReturnNode returnFromHome: (self expr asGemstoneNodeInEnvironment: env)