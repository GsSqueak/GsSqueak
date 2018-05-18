initialization
setDefaultParameters
	"change the receiver's appareance parameters"

	self
		color: (self userInterfaceTheme color ifNil: [Color r: 0.977 g: 0.977 b: 0.977]);
		borderStyle: (self userInterfaceTheme borderStyle ifNil: [BorderStyle default]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color transparent]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [0]);
		barColor: (self userInterfaceTheme barColor ifNil: [Color r: 0.72 g: 0.72 b: 0.9]).