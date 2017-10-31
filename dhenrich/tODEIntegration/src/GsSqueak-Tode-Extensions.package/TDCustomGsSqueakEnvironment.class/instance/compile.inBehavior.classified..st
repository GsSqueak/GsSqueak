compilation
compile: source inBehavior: theBehavior classified: methodProtocol
  ^ theBehavior
    compileMethod: source
    category: methodProtocol
    using: self symbolList
    environmentId: self methodCompilationEnvironmentId