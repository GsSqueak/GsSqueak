geometry
userInitials: aString andPicture: aForm 
	| _gsSqueakTemp_cb _gsSqueakTemp_pictRect _gsSqueakTemp_initRect _gsSqueakTemp_f |
	userInitials := aString.
	_gsSqueakTemp_pictRect := _gsSqueakTemp_initRect := _gsSqueakTemp_cb := self cursorBounds.
	userInitials isEmpty
		ifFalse: [_gsSqueakTemp_f := TextStyle defaultFont.
			_gsSqueakTemp_initRect := _gsSqueakTemp_cb topRight + (0 @ 4) extent: (_gsSqueakTemp_f widthOfString: userInitials)
							@ _gsSqueakTemp_f height].
	self userPicture: aForm.
	aForm
		ifNotNil: [_gsSqueakTemp_pictRect := self cursorBounds topRight + (0 @ 24) extent: aForm extent].
	self
		bounds: ((_gsSqueakTemp_cb merge: _gsSqueakTemp_initRect)
				merge: _gsSqueakTemp_pictRect)