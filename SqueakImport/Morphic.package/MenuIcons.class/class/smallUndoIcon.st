accessing - icons
smallUndoIcon

	^ Icons
		at: #smallUndoIcon
		ifAbsentPut: [ self smallUndoIconContents ]