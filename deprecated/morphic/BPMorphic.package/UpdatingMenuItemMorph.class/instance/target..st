wording
target: anObject 
	"For us if the old target and wording provider are the same update
	both. "
	target = wordingProvider
		ifTrue: [wordingProvider := target := anObject]
		ifFalse: [target := anObject]