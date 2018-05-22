initialization
setDefaultParameters
	"change the receiver's appareance parameters"

	self
		color: (self userInterfaceTheme color ifNil: [Color white]);
		borderStyle: (self userInterfaceTheme borderStyle ifNil: [BorderStyle default]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color gray: 0.6]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]).