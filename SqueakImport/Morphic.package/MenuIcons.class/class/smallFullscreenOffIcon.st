accessing - icons
smallFullscreenOffIcon

	^ Icons
		at: #smallFullscreenOffIcon
		ifAbsentPut: [ self smallFullscreenOffIconContents ]