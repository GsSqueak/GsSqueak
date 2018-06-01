initialization
textHighlightColor
	"Answer my default text highlight color."
	^self valueOfProperty: #textHighlightColor ifAbsent: [ self textColor negated ].
