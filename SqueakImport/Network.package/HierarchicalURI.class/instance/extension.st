accessing
extension
	"This method assumes a $. as extension delimiter"

	| i leafName |
	leafName := self pathComponents last.
	i := leafName findLast: [:c | c = $.].
	^i = 0
		ifTrue: ['']
		ifFalse: [leafName copyFrom: i + 1 to: leafName size].
