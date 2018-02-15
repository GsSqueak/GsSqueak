actions
toggleStamps
	"The sub panel that has the stamps in it. For saving and moving parts
	of an image."
	| _gsSqueakTemp_tab _gsSqueakTemp_otherTab _gsSqueakTemp_st _gsSqueakTemp_shapes |
	_gsSqueakTemp_shapes := self submorphNamed: 'shapes'.
	_gsSqueakTemp_otherTab := self submorphNamed: 'shapeTab'.
	_gsSqueakTemp_tab := self submorphNamed: 'stampTab'.
	(_gsSqueakTemp_st := self submorphNamed: 'stamps') visible
		ifTrue: [_gsSqueakTemp_st hide.
			_gsSqueakTemp_st bottom: self bottom.
			_gsSqueakTemp_tab top: self bottom - 1.
			_gsSqueakTemp_shapes top: self bottom - 9.
			_gsSqueakTemp_otherTab
				top: (_gsSqueakTemp_shapes visible
						ifTrue: [_gsSqueakTemp_shapes bottom - _gsSqueakTemp_otherTab height + 10]
						ifFalse: [self bottom - 1])]
		ifFalse: [_gsSqueakTemp_st top: self bottom - 10.
			_gsSqueakTemp_st show.
			_gsSqueakTemp_tab top: _gsSqueakTemp_st bottom - 0.
			_gsSqueakTemp_shapes top: _gsSqueakTemp_st bottom - 9.
			_gsSqueakTemp_otherTab
				top: (_gsSqueakTemp_shapes visible
						ifTrue: [_gsSqueakTemp_shapes bottom - _gsSqueakTemp_otherTab height + 10]
						ifFalse: [_gsSqueakTemp_st bottom - 0])].
	self layoutChanged