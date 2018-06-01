accessing - icons
smallOkIcon

	^ Icons
		at: #smallOkIcon
		ifAbsentPut: [ self smallOkIconContents ]