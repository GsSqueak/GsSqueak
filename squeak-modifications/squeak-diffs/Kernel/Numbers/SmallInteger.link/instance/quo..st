arithmetic
quo: aNumber
  "Divides the receiver by aNumber.  Returns the integer quotient, with
 truncation toward zero.  For example,

 -9 quo: 4 = -2

 The selector rem: returns the remainder from this division."
  "GemStone Primitive"
  <primitive: 13>
  aNumber == 0
    ifTrue: [ ^ self _errorDivideByZero ]
    ifFalse: [ ^ super quo: aNumber ]
