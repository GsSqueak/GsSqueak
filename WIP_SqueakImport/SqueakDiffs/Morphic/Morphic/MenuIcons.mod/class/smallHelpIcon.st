accessing - icons
smallHelpIcon

	^ Icons
		at: #smallHelpIcon
		ifAbsentPut: [ self smallHelpIconContents ]