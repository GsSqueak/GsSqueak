accessing
exclusive: aBoolean 
	exclusive := aBoolean.
	exclusive
		ifTrue: [self activeHand newMouseFocus: self]
		ifFalse: [self activeHand releaseMouseFocus: self]