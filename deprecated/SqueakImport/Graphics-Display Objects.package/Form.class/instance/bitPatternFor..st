color mapping
bitPatternFor: aColor
	"Return the pixel word for representing the given color on the receiver"
	^aColor bitPatternForDepth: self depth