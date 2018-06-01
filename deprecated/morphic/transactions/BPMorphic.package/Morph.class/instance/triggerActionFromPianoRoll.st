-Morphic-Sound-piano rolls
triggerActionFromPianoRoll
	"a hack to allow for abitrary morphs to be dropped into piano roll"
	| _gsSqueakTemp_evt |
	self world
		ifNil: [^ self].
	_gsSqueakTemp_evt := MouseEvent new
				setType: nil
				position: self center
				buttons: 0
				hand: self world activeHand.
	self programmedMouseUp: _gsSqueakTemp_evt for: self