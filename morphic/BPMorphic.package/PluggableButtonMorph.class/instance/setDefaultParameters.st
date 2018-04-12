initialization
setDefaultParameters
	"change the receiver's appareance parameters"
	self
		color: (self userInterfaceTheme color
				ifNil: [Color gray: 0.91]);
		
		borderStyle: (self userInterfaceTheme borderStyle
				ifNil: [BorderStyle default]);
		
		borderColor: (self userInterfaceTheme borderColor
				ifNil: [Color gray]);
		
		borderWidth: (self userInterfaceTheme borderWidth
				ifNil: [1]);
		
		font: (self userInterfaceTheme font
				ifNil: [TextStyle defaultFont]);
		
		textColor: (self userInterfaceTheme textColor
				ifNil: [Color black]).
	borderColor := self borderColor.
	self offColor: self color