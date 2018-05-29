accessing
digitValue
  "Returns a SmallInteger representing the value of the receiver,
 a digit, or returns nil if the receiver is not a digit."

  self isDigit
    ifTrue: [ ^ self asciiValue - $0 asciiValue ].
  self isLowercase
    ifTrue: [ ^ self asciiValue - $a asciiValue + 10 ].
  self isUppercase
    ifTrue: [ ^ self asciiValue - $A asciiValue + 10 ].
  ^ -1
