accessing - icons
smallJustifiedIcon

	^ Icons
		at: #smallJustifiedIcon
		ifAbsentPut: [ self smallJustifiedIconContents ]