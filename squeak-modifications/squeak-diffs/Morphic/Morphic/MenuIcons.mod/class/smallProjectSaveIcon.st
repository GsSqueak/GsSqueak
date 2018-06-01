accessing - icons
smallProjectSaveIcon

	^ Icons
		at: #smallProjectSaveIcon
		ifAbsentPut: [ self smallProjectSaveIconContents ]