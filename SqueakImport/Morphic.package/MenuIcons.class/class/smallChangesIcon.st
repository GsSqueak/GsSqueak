accessing - icons
smallChangesIcon

	^ Icons
		at: #smallChangesIcon
		ifAbsentPut: [ self smallChangesIconContents ]