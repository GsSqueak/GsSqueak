testing
listCopy
  ^ self copy
    cdr:
      (cdr isConsCell
        ifFalse: [ cdr ]
        ifTrue: [ cdr listCopy ])