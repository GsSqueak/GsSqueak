private
safeLength
  cdr isNil
    ifTrue: [ ^ 1 ].
  cdr isConsCell
    ifFalse: [ ^ 2 ].
  ^ cdr safeLength + 1