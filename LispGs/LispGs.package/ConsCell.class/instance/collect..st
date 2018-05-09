iterating
collect: aBlock
  ^ self class
    car: (aBlock value: car)
    cdr:
      (cdr isConsCell
        ifTrue: [ cdr collect: aBlock ]
        ifFalse: [ cdr ])