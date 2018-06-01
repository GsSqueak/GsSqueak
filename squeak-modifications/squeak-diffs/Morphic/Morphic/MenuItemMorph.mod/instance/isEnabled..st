accessing
isEnabled: aBoolean

	| colorToUse |
	isEnabled = aBoolean ifTrue: [^ self].
	isEnabled := aBoolean.
	
	colorToUse := isEnabled
		ifTrue: [self userInterfaceTheme textColor ifNil: [Color black]]
		ifFalse: [self userInterfaceTheme disabledTextColor ifNil: [Color gray]].
	
	self color: colorToUse.