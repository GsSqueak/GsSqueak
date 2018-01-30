private
fastFindFirstLineSuchThat: lineBlock 
	"Perform a binary search of the lines array and return the index
	of the first element for which lineBlock evaluates as true.
	This assumes the condition is one that goes from false to true for
	increasing line numbers (as, eg, yval > somey or start char > somex).
	If lineBlock is not true for any element, return size+1."
	^ lines
		findBinaryIndex: [:each | (lineBlock value: each)
				ifTrue: [-1]
				ifFalse: [1]]
		ifNone: [:lower :upper | upper]