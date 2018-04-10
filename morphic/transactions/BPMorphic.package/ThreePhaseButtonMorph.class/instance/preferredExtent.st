accessing
preferredExtent
	| _gsSqueakTemp_iw _gsSqueakTemp_ih _gsSqueakTemp_lw _gsSqueakTemp_lh |
	self currentImage
		ifNil: [^ 1 @ 1].
	_gsSqueakTemp_iw := self currentImage width.
	_gsSqueakTemp_ih := self currentImage height.
	_gsSqueakTemp_lw := self font
				widthOfString: (self label
						ifNil: ['']).
	_gsSqueakTemp_lh := self font height.
	^ _gsSqueakTemp_iw + 3 + _gsSqueakTemp_lw
		@ (_gsSqueakTemp_ih max: _gsSqueakTemp_lh)