testing
isFullOnScreen
  "Answer if the receiver is full contained in the owner visible 
	area."

  self owner isInMemory
    ifFalse: [ ^ true ].
  self owner isNil
    ifTrue: [ ^ true ].
  self visible
    ifFalse: [ ^ true ].
  ^ self owner clearArea containsRect: self fullBounds