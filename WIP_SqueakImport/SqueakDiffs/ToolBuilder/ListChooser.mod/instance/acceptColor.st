colors
acceptColor
	
	self canAdd ifTrue: [^ self addColor].
	
	^ self canAccept 
		ifTrue: [ self userInterfaceTheme okColor ifNil: [(Color r: 0.49 g: 0.749 b: 0.49)] ]
		ifFalse: [ self userInterfaceTheme disabledColor ifNil: [Color lightGray] ]