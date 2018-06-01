filename
inputText: aText 
	"user has entered a potential filename in the text field.
	Check it against the current pattern; if it is ok we can accept it and then if it is a file in
	the current list, highlight it.
	If it would not match the pattern, alert the user as best we can"
	| candidate |
	candidate := aText asString.
	(patternList anySatisfy: [:p | p match: candidate])
		ifTrue: [fileName := candidate.
			listIndex := nameList findFirst: [:nm | nm = fileName].
			self changed: #fileListIndex.
				^true]
		ifFalse: [fileName := nil.
				self changed: #flash.
			^false]