translating
asGemstoneNodeInEnvironment: env
  | gsArrayBuilderNode |
  gsArrayBuilderNode := GsComArrayBuilderNode new.
  self elements
    do: [ :elem | gsArrayBuilderNode appendElement: (elem asGemstoneNodeInEnvironment: env) ].
  ^ gsArrayBuilderNode