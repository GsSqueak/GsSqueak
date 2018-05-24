accessing - icons
smallCopyIcon

	^ Icons
		at: #smallCopyIcon
		ifAbsentPut: [ self smallCopyIconContents ]