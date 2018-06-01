accessing - icons
smallPinIcon

	^ Icons
		at: #smallPinIcon
		ifAbsentPut: [ self smallPinIconContents ]