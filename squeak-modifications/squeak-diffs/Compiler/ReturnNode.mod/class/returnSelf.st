gssqueak parser
returnSelf
  ^ self new
    expr: (VariableNode new name: 'self' key: 'self' code: nil)
