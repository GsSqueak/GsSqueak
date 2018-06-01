accessing - icons
smallQuitNoSaveIcon

	^ Icons
		at: #smallQuitNoSaveIcon
		ifAbsentPut: [ self smallQuitNoSaveIconContents ]