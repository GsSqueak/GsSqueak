accessing
atIndex: integer ifAbsent: exceptionBlock
	"As we are sequenceable, provide index-based access."

	integer > tally ifTrue: [ ^exceptionBlock value ].
	^order at: integer ifAbsent: exceptionBlock