translating
returnSelf
  ^ self new expr: (SqVariableNode new name: 'self' key: 'self' code: nil)
