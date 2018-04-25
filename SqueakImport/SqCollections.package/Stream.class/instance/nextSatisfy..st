accessing
nextSatisfy: aBlock

	self do: [:each | (aBlock value: each) ifTrue: [^ each]].
	Error signal: 'No object could satisfy the block'.