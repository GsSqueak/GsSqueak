accessing - icons
smallTimerIcon

	^ Icons
		at: #smallTimerIcon
		ifAbsentPut: [ self smallTimerIconContents ]