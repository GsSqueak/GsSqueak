accessing
nthCell: n ifAbsent: aBlock
  n isZero
    ifTrue: [ ^ self ].
  n = 1
    ifTrue: [ ^ cdr ifNil: [ aBlock value ] ].
  ^ cdr nthCell: n - 1 ifAbsent: aBlock