initialize-release
setDefaultParameters
	disabledColor := self userInterfaceTheme disabledColor
				ifNil: [Color transparent].
	disabledTextColor := self userInterfaceTheme disabledTextColor
				ifNil: [Color gray: 0.6].
	super setDefaultParameters