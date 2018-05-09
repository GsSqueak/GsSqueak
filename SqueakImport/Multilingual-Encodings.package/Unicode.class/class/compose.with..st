composing
compose: baseChar with: compositionChar
	"Answers the composition of baseChar and compositionChar if such a combination exists.
	Answers nil if the combination does not exist."
	^Character value: 
		((Compositions at: baseChar asInteger ifAbsent:[^nil])
			at: compositionChar asInteger ifAbsent:[^nil])