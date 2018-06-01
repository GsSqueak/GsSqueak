initialization
defaultBorderColor
	"answer the default border color/fill style for the receiver"
	^ self userInterfaceTheme borderColor ifNil: [Color blue twiceDarker alpha: 0.75]