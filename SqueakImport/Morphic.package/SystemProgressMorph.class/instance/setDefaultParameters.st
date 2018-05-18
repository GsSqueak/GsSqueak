initialization
setDefaultParameters
	"change the receiver's appareance parameters"

	self
		color: (self userInterfaceTheme color ifNil: [Color r: 0.9 g: 0.9 b: 0.9]);
		borderStyle: (self userInterfaceTheme borderStyle ifNil: [BorderStyle default]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color gray]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]).

	Preferences menuAppearance3d ifTrue: [self addDropShadow].

	self
		font: (self userInterfaceTheme font ifNil: [TextStyle defaultFont]);
		textColor: (self userInterfaceTheme textColor ifNil: [Color black]).

	self
		updateColor: self
		color: self color
		intensity: 1.