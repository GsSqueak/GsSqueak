editing
setFontSize
	| _gsSqueakTemp_sizes _gsSqueakTemp_reply _gsSqueakTemp_family |
	_gsSqueakTemp_family := font
				ifNil: [TextStyle default]
				ifNotNil: [font textStyle].
	_gsSqueakTemp_family
		ifNil: [_gsSqueakTemp_family := TextStyle default].
	"safety net -- this line SHOULD be unnecessary now"
	_gsSqueakTemp_sizes := _gsSqueakTemp_family fontNamesWithPointSizes.
	_gsSqueakTemp_reply := UIManager default chooseFrom: _gsSqueakTemp_sizes values: _gsSqueakTemp_sizes.
	_gsSqueakTemp_reply
		ifNotNil: [self
				font: (_gsSqueakTemp_family
						fontAt: (_gsSqueakTemp_sizes indexOf: _gsSqueakTemp_reply))]