keyboard navigation
setSelectionIndex: idx 
	"Called internally to select the index-th item."
	| _gsSqueakTemp_theMorph _gsSqueakTemp_index _gsSqueakTemp_max _gsSqueakTemp_currentIndex |
	idx
		ifNil: [^ self].
	_gsSqueakTemp_max := scroller submorphs size.
	_gsSqueakTemp_currentIndex := self getSelectionIndex.
	_gsSqueakTemp_index := idx min: _gsSqueakTemp_max max: 0.
	_gsSqueakTemp_theMorph := _gsSqueakTemp_index = 0
				ifFalse: [scroller submorphs at: _gsSqueakTemp_index].
	"Skip invisible rows."
	[_gsSqueakTemp_theMorph notNil
		and: [_gsSqueakTemp_theMorph visible not]]
		whileTrue: [_gsSqueakTemp_currentIndex < _gsSqueakTemp_index
				ifTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1]
				ifFalse: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1].
			(_gsSqueakTemp_index < 1
					or: [_gsSqueakTemp_index > _gsSqueakTemp_max])
				ifTrue: [^ self].
			_gsSqueakTemp_theMorph := scroller submorphs at: _gsSqueakTemp_index].
	self setSelectedMorph: _gsSqueakTemp_theMorph