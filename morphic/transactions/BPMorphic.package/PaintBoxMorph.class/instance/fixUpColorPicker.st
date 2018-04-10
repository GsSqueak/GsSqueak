recent colors
fixUpColorPicker
	| _gsSqueakTemp_chart _gsSqueakTemp_picker |
	_gsSqueakTemp_chart := self class colorChart.
	_gsSqueakTemp_chart getCanvas frameRectangle: _gsSqueakTemp_chart boundingBox color: Color black.
	_gsSqueakTemp_picker := Form extent: _gsSqueakTemp_chart extent + (14 @ 12) depth: 16.
	_gsSqueakTemp_picker fillWhite.
	"top"
	_gsSqueakTemp_picker
		copy: (0 @ 0 extent: _gsSqueakTemp_picker width @ 6)
		from: colorMemory image width - _gsSqueakTemp_picker width @ 0
		in: colorMemory image
		rule: Form over.
	"bottom"
	_gsSqueakTemp_picker
		copy: (0 @ (_gsSqueakTemp_picker height - 6) extent: _gsSqueakTemp_picker width @ 6)
		from: colorMemory image width - _gsSqueakTemp_picker width @ (colorMemory image height - 7)
		in: colorMemory image
		rule: Form over.
	"left"
	_gsSqueakTemp_picker
		copy: (0 @ 6 corner: 8 @ (_gsSqueakTemp_picker height - 6))
		from: colorMemory image boundingBox topLeft + (0 @ 6)
		in: colorMemory image
		rule: Form over.
	"right"
	_gsSqueakTemp_picker
		copy: (_gsSqueakTemp_picker width - 6 @ 6 corner: _gsSqueakTemp_picker width @ (_gsSqueakTemp_picker height - 6))
		from: colorMemory image boundingBox topRight - (6 @ -6)
		in: colorMemory image
		rule: Form over.
	_gsSqueakTemp_chart displayOn: _gsSqueakTemp_picker at: 8 @ 6.
	_gsSqueakTemp_picker getCanvas frameRectangle: _gsSqueakTemp_picker boundingBox color: Color black.
	colorMemory image: _gsSqueakTemp_picker