*EnvironmentsEnv7-binding
bindingOf: aSymbol ifAbsent: aBlock
  ^ bindings associationAt: aSymbol ifAbsent: aBlock
