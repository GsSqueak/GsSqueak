initialize-release
setDefaultParameters
	"private - set the default parameter using Preferences as the inspiration source"

	self
		color: (self userInterfaceTheme color ifNil: [Color r: 0.9 g: 0.9 b: 0.9]);
		borderStyle: (self userInterfaceTheme borderStyle ifNil: [BorderStyle default]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color gray]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [0]).
		
	self extent: (Preferences standardMenuFont height asPoint).