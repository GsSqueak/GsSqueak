testing
shouldBePrintedAsLiteralVisiting: aSet
	self class == Array ifFalse:
		[^false].
	(aSet includes: self) ifTrue:
		[^false].
	aSet add: self.
	^self allSatisfy: [:each | each shouldBePrintedAsLiteralVisiting: aSet]
