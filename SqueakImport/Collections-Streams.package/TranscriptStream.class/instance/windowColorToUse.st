model protocol
windowColorToUse

	^ Color colorFrom: (Model useColorfulWindows
		ifTrue: [self userInterfaceTheme customWindowColor ifNil: [Color r: 0.9 g: 0.75 b: 0.45]]
		ifFalse: [self userInterfaceTheme uniformWindowColor ifNil: [Color veryVeryLightGray]])