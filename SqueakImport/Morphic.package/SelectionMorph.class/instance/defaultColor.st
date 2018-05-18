initialization
defaultColor
	"answer the default color/fill style for the receiver"
	^ self userInterfaceTheme color ifNil: [Color blue alpha: 0.08]
