accessing - icons
smallFullscreenOnIcon

	^ Icons
		at: #smallFullscreenOnIcon
		ifAbsentPut: [ self smallFullscreenOnIconContents ]