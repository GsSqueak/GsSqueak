accessing - icons
smallDeleteIcon

	^ Icons
		at: #smallDeleteIcon
		ifAbsentPut: [ self smallDeleteIconContents ]