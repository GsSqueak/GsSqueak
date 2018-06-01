class list
selectedClass
	"Answer the currently selected class."

	| pairString |

	self flag: #mref.	"allows for old-fashioned style"

	classListIndex = 0 ifTrue: [^nil].
	pairString := classList at: classListIndex.
	(pairString isKindOf: MethodReference) ifTrue: [
		^pairString actualClass
	].
	(pairString includes: $*) ifTrue: [pairString := pairString allButFirst].
	MessageSet 
		parse: pairString
		toClassAndSelector: [:cls :sel | ^ cls].