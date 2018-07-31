translating
asGemstoneNodeInEnvironment: env
  | gsArrayBuilderNode |
  gsArrayBuilderNode := (GemstoneSmalltalk _env0 at: #GsComArrayBuilderNode) _env0 new.
  self elements
    do: [ :elem | gsArrayBuilderNode _env0 appendElement: (elem asGemstoneNodeInEnvironment: env) ].
  ^ gsArrayBuilderNode
