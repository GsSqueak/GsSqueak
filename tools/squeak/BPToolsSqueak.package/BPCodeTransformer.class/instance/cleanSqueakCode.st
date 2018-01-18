transforming
cleanSqueakCode
	self hasStyleBlock ifTrue: [
		self removeStyleBlock ].
	self removeExclamationMark.
	