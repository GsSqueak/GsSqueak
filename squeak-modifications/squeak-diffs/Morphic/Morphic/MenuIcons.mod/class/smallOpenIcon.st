accessing - icons
smallOpenIcon

	^ Icons
		at: #smallOpenIcon
		ifAbsentPut: [ self smallOpenIconContents ]