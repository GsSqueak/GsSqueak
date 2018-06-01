as yet unclassified
outerContext
  "Answer the context within which the receiver is nested."

  ^ closureOrNil
    ifNil: [ self ]
    ifNotNil: [ 
      "the context of the parent"
      self sender outerContext ]
