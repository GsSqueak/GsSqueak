parts bin
residesInPartsBin
  "Answer true if the receiver is, or has some ancestor owner who is, a
	parts bin"

  ^ self owner ifNil: [ false ] ifNotNil: [ self owner residesInPartsBin ]