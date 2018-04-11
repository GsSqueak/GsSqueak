as yet unclassified
returnSelf
  ^ self _basicNew initialize
    expr: (SqVariableNode new name: 'self' key: 'self' code: nil)