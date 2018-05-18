accessing - icons
smallAuthoringToolsIcon

	^ Icons
		at: #smallAuthoringToolsIcon
		ifAbsentPut: [ self smallAuthoringToolsIconContents ]