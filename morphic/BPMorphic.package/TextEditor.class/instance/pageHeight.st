private
pageHeight
	| _gsSqueakTemp_howManyLines _gsSqueakTemp_visibleHeight _gsSqueakTemp_totalHeight _gsSqueakTemp_ratio |
	_gsSqueakTemp_howManyLines := paragraph numberOfLines.
	_gsSqueakTemp_visibleHeight := self visibleHeight.
	_gsSqueakTemp_totalHeight := self totalTextHeight.
	_gsSqueakTemp_ratio := _gsSqueakTemp_visibleHeight / _gsSqueakTemp_totalHeight.
	^ (_gsSqueakTemp_ratio * _gsSqueakTemp_howManyLines) rounded - 2