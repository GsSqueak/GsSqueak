attributes
couldDeriveFromPrettyPrinting
	"Return true if the receiver has any TextAttributes that are functional rather than simply appearance-related"
	runs values do:
		[:emphArray | emphArray do:
			[:emph | emph couldDeriveFromPrettyPrinting ifFalse: [^ false]]].
	^ true