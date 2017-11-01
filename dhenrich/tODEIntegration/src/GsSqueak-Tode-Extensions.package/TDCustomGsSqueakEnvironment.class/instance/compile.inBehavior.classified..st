compilation
compile: source inBehavior: theBehavior classified: methodProtocol
  theBehavior
    compileMethod: source
    category: methodProtocol
    using: self symbolList
    environmentId: self methodCompilationEnvironmentId.
  ^ (self _parseSelector: source for: theBehavior) ifNotNil: [ :s | s asSymbol ]