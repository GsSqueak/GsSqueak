accessing - icons
smallProjectIcon

	^ Icons
		at: #smallProjectIcon
		ifAbsentPut: [ self smallProjectIconContents ]