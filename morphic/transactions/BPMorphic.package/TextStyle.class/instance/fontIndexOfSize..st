fonts and font indexes
fontIndexOfSize: desiredHeight 
	"Returns an index in fontArray of the font with height <=
	desiredHeight "
	"Leading is not inluded in the comparison"
	| _gsSqueakTemp_bestMatch _gsSqueakTemp_bestIndex _gsSqueakTemp_d |
	_gsSqueakTemp_bestMatch := 9999.
	_gsSqueakTemp_bestIndex := 1.
	1
		to: fontArray size
		do: [:i | 
			_gsSqueakTemp_d := desiredHeight - (fontArray at: i) height.
			_gsSqueakTemp_d = 0
				ifTrue: [^ i].
			(_gsSqueakTemp_d > 0
					and: [_gsSqueakTemp_d < _gsSqueakTemp_bestMatch])
				ifTrue: [_gsSqueakTemp_bestIndex := i.
					_gsSqueakTemp_bestMatch := _gsSqueakTemp_d]].
	^ _gsSqueakTemp_bestIndex