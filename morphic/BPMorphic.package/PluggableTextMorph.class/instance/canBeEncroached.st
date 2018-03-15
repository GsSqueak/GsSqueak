testing
canBeEncroached
	"Fixed-height always report true, since they cannot be encroached."
	self layoutFrame
		ifNotNil: [:frame | frame topFraction = frame bottomFraction
				ifTrue: [^ true]].
	^ textMorph height + 10 < self height