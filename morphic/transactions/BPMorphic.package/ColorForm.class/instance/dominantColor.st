analyzing
dominantColor
	"Overridden to consider color table"
	| _gsSqueakTemp_tally _gsSqueakTemp_max _gsSqueakTemp_maxi |
	_gsSqueakTemp_tally := self tallyPixelValues.
	_gsSqueakTemp_max := _gsSqueakTemp_maxi := 0.
	_gsSqueakTemp_tally
		withIndexDo: [:n :i | n > _gsSqueakTemp_max
				ifTrue: [_gsSqueakTemp_max := n.
					_gsSqueakTemp_maxi := i]].
	^ self colors at: _gsSqueakTemp_maxi