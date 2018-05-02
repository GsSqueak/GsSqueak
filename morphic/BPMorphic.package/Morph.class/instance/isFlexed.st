testing
isFlexed
  "Return true if the receiver is currently flexed"

  self owner ifNil: [ ^ false ].
  ^ self owner isFlexMorph