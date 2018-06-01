commands
appendValue: aPointOrNumber

	| newVal |
	(data isKindOf: OrderedCollection) ifFalse: [data := data asOrderedCollection].
	newVal := self asNumber: aPointOrNumber.
	data addLast: newVal.
	newVal < minVal ifTrue: [minVal := newVal].
	newVal > maxVal ifTrue: [maxVal := newVal].
	self cursor: data size.
	self flushCachedForm.
