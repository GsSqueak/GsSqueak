notification
localeChanged
	| _gsSqueakTemp_caption |
	_gsSqueakTemp_caption := ColorPickerMorph noColorCaption.
	_gsSqueakTemp_caption displayOn: ColorChart at: ColorChart boundingBox topCenter - (_gsSqueakTemp_caption width // 2 @ 0)