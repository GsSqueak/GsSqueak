accessing - icons
smallProjectLoadIcon

	^ Icons
		at: #smallProjectLoadIcon
		ifAbsentPut: [ self smallProjectLoadIconContents ]