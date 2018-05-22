accessing - icons
smallPrintIcon

	^ Icons
		at: #smallPrintIcon
		ifAbsentPut: [ self smallPrintIconContents ]