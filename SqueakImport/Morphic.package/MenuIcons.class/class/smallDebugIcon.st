accessing - icons
smallDebugIcon

	^ Icons
		at: #smallDebugIcon
		ifAbsentPut: [ self smallDebugIconContents ]