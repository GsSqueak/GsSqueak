accessing - icons
smallScreenshotIcon

	^ Icons
		at: #smallScreenshotIcon
		ifAbsentPut: [ self smallScreenshotIconContents ]