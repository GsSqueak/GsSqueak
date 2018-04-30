other
deferUpdatesIn: aRectangle while: aBlock
	| result |
	(self deferUpdates: true) ifTrue: [^aBlock value].
	result := aBlock value.
	self deferUpdates: false.
	self forceToScreen: aRectangle.
	^result