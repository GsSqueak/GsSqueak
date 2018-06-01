colors
addColor
	
	^ self canAdd 
		ifTrue: [ self userInterfaceTheme addColor ifNil: [Color blue muchLighter] ]
		ifFalse: [ self userInterfaceTheme disabledColor ifNil: [Color lightGray] ]