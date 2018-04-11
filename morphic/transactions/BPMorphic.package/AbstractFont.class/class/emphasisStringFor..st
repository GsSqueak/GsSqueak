utilities
emphasisStringFor: emphasisCode 
	"Answer a translated string that represents the attributes
	given in emphasisCode."
	| _gsSqueakTemp_emphases |
	emphasisCode = 0
		ifTrue: [^ 'Normal' translated].
	_gsSqueakTemp_emphases := #('Bold' 'Italic' 'Underlined' 'Narrow' 'StruckOut' ).
	^ String
		streamContents: [:s | 
			1
				to: _gsSqueakTemp_emphases size
				do: [:i | (emphasisCode bitAt: i) isZero
						ifFalse: [s nextPutAll: (_gsSqueakTemp_emphases at: i) translated;
								 space]].
			s position isZero
				ifFalse: [s skip: -1]]