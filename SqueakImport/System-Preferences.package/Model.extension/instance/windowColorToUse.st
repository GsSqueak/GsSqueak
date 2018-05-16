*System-preferences
windowColorToUse

	^ Color colorFrom: (self class useColorfulWindows
		ifTrue: [self userInterfaceTheme customWindowColor ifNil: [self defaultWindowColor]]
		ifFalse: [self uniformWindowColor])