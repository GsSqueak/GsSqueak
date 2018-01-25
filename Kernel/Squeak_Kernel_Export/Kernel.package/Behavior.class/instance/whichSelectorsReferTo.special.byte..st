testing method dictionary
whichSelectorsReferTo: literal special: specialFlag byte: specialByte
	"Answer a set of selectors whose methods access the argument as a literal."

	^self whichSelectorsReferTo: literal special: specialFlag byte: specialByte thorough: false