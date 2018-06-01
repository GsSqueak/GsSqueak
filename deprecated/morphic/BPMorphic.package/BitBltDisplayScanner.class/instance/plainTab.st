stop conditions
plainTab
	| _gsSqueakTemp_nextDestX |
	_gsSqueakTemp_nextDestX := super plainTab.
	fillBlt == nil
		ifFalse: [fillBlt
				destX: destX
				destY: destY
				width: _gsSqueakTemp_nextDestX - destX
				height: font height;
				 copyBits].
	^ _gsSqueakTemp_nextDestX