private
lookUpFunction: anObject
  "in Scheme a function can be an arbitrary form which evaluates to a
	lambda expression"

  anObject isLispPrimitive
    ifTrue: [ ^ anObject ].
  anObject isLispClosure
    ifTrue: [ ^ anObject ].
  anObject isSymbol
    ifFalse: [ ^ self evalObject: anObject ].
  ^ self symbolFunction: anObject ifNone: [ anObject ]