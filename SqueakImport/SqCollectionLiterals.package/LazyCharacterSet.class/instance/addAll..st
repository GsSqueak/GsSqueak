adding
addAll: aCollection
	self block: [:c | (aCollection includes: c) or: [block value: c]].
	^aCollection
