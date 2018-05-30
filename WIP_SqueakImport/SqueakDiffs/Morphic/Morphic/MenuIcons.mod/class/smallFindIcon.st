accessing - icons
smallFindIcon

	^ Icons
		at: #smallFindIcon
		ifAbsentPut: [ self smallFindIconContents ]