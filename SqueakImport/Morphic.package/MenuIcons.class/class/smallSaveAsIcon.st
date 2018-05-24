accessing - icons
smallSaveAsIcon

	^ Icons
		at: #smallSaveAsIcon
		ifAbsentPut: [ self smallSaveAsIconContents ]