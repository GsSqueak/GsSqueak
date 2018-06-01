accessing
colorToUse

	^ isSelected & isEnabled
		ifTrue: [ self userInterfaceTheme selectionTextColor ifNil: [Color white] ]
		ifFalse: [ color ]