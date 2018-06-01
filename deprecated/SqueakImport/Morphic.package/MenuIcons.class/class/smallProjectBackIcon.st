accessing - icons
smallProjectBackIcon

	^ Icons
		at: #smallProjectBackIcon
		ifAbsentPut: [ self smallProjectBackIconContents ]