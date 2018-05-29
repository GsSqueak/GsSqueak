accessing
at: key ifPresentAndInMemory: aBlock
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."

	| v |
	v := self at: key ifAbsent: [^ nil].
	v isInMemory ifFalse: [^ nil].
	^ aBlock value: v
