*MCEnvSwitch
compile: methodText classified: cat env: envId
  "Returns nil, or a selector Symbol, or signals a CompileError"

  self
    compileMethod: methodText
    category: cat
    using: GsSession currentSession symbolList
    environmentId: envId.
  ^ (Behavior parseSelector: methodText for: self) ifNotNil: [ :s | s asSymbol ]