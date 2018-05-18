accessing
derivativeFonts
	derivativeFonts ifNil: [^#()].
	^derivativeFonts copyWithout: nil