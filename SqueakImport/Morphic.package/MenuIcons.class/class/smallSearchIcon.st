accessing - icons
smallSearchIcon

	^ Icons
		at: #smallSearchIcon
		ifAbsentPut: [ self smallSearchIconContents ]