*SqClasses-testing method dictionary
whichSelectorsReferTo: literal 
	"Answer a Set of selectors whose methods access the argument as a literal."

	^self whichSelectorsReferTo: literal thorough: false

	"Rectangle whichSelectorsReferTo: #+."
