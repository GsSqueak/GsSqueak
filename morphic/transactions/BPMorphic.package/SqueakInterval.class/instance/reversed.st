converting
reversed
	self isEmpty
		ifTrue: [^ stop to: start by: step negated].
	^ self last to: start by: step negated