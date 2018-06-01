monticello
compiledMethod
  ^ self actualClass
    compiledMethodAt: methodSymbol
    environmentId: self environmentId