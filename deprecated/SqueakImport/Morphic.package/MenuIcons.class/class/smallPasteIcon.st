accessing - icons
smallPasteIcon

	^ Icons
		at: #smallPasteIcon
		ifAbsentPut: [ self smallPasteIconContents ]