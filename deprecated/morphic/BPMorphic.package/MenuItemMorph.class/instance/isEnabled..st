accessing
isEnabled: aBoolean 
	| _gsSqueakTemp_colorToUse |
	isEnabled = aBoolean
		ifTrue: [^ self].
	isEnabled := aBoolean.
	_gsSqueakTemp_colorToUse := isEnabled
				ifTrue: [self userInterfaceTheme textColor
						ifNil: [Color black]]
				ifFalse: [self userInterfaceTheme disabledTextColor
						ifNil: [Color gray]].
	self color: _gsSqueakTemp_colorToUse