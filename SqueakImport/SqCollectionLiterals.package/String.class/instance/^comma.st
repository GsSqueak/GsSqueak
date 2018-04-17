converting
, anObject
	"Concatenate the argument to the receiver.
		Transcript cr; show: 'The value is: ', 3.
	"
	^ self copyReplaceFrom: self size + 1
		  to: self size
		  with: anObject asString