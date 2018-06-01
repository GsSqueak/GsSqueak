accessing - icons
smallCenteredIcon

	^ Icons
		at: #smallCenteredIcon
		ifAbsentPut: [ self smallCenteredIconContents ]