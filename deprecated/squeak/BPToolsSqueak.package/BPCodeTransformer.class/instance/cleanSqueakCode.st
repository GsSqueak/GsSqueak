transforming
cleanSqueakCode
	self hasStyleBlock ifTrue: [
		self removeStyleBlock ].
	self expectsExclamationMark ifTrue: [
		self removeExclamationMark ].
	