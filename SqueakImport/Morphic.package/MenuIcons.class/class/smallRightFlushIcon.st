accessing - icons
smallRightFlushIcon

	^ Icons
		at: #smallRightFlushIcon
		ifAbsentPut: [ self smallRightFlushIconContents ]