notification
localeChanged
	| caption |
	caption := ColorPickerMorph noColorCaption.
	ColorChart ifNotNil: [
		caption displayOn: ColorChart at: ColorChart boundingBox topCenter - (caption width // 2 @ 0)].