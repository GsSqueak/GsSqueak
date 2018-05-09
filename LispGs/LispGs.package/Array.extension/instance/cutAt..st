*LispGs
cutAt: aNumber
  self size <= aNumber
    ifTrue: [ ^ self ].
  ^ self first: aNumber