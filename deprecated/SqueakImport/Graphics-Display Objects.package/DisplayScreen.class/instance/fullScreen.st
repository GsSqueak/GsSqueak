other
fullScreen   "Display fullScreen"

	ScreenSave notNil ifTrue: [Display := ScreenSave].
	clippingBox := super boundingBox