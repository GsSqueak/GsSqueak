actions
toggleShapes
	"The sub panel that has the shape tools on it. Rect, line..."
	| _gsSqueakTemp_tab _gsSqueakTemp_sh _gsSqueakTemp_stamps |
	_gsSqueakTemp_stamps := self submorphNamed: 'stamps'.
	_gsSqueakTemp_tab := self submorphNamed: 'shapeTab'.
	(_gsSqueakTemp_sh := self submorphNamed: 'shapes') visible
		ifTrue: [_gsSqueakTemp_sh hide.
			_gsSqueakTemp_tab top: _gsSqueakTemp_stamps bottom - 1]
		ifFalse: [_gsSqueakTemp_sh comeToFront.
			_gsSqueakTemp_sh top: _gsSqueakTemp_stamps bottom - 9.
			_gsSqueakTemp_sh show.
			_gsSqueakTemp_tab top: _gsSqueakTemp_sh bottom - _gsSqueakTemp_tab height + 10].
	self layoutChanged