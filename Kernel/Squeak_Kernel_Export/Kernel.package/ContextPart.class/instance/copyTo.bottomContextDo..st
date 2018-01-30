query
copyTo: aContext bottomContextDo: aBlock
	"Copy self and my sender chain down to, but not including, aContext.  End of copied chain will have nil sender. Evaluate aBlock with the copy of bottom context when it still points to the original sender."

	| copy |
	self == aContext ifTrue: [ ^nil ].
	copy := self copy.
	sender
		ifNil: [ aBlock value: copy ]
		ifNotNil: [
			sender == aContext ifTrue: [ aBlock value: copy ].
			copy privSender: (sender copyTo: aContext bottomContextDo: aBlock) ].
	^copy