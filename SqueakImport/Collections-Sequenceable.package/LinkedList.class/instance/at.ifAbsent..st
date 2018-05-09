accessing
at: index ifAbsent: exceptionBlock
	"Optimized to scan the list once, super would twice."
	| i |
	index < 1 ifTrue: [^exceptionBlock value].
	i := 0.
	self do: [:link |
		(i := i + 1) = index ifTrue: [^ link]].
	^exceptionBlock value