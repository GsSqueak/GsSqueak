accessing - icons
smallLeftFlushIcon

	^ Icons
		at: #smallLeftFlushIcon
		ifAbsentPut: [ self smallLeftFlushIconContents ]