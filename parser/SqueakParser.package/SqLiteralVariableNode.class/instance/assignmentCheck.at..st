testing
assignmentCheck: encoder at: location
  ^ (key isVariableBinding
    and: [ (SymbolAssociation new isKindOf: SymbolAssociation) not ])
    ifTrue: [ location ]
    ifFalse: [ -1 ]