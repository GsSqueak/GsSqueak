pen
setPenDown: penDown 
	"Set the penDown state as indicated, to true or false"
	| _gsSqueakTemp_morph _gsSqueakTemp_trailMorph _gsSqueakTemp_tfm |
	self actorState setPenDown: penDown.
	((_gsSqueakTemp_morph := self costume) notNil
			and: [(_gsSqueakTemp_trailMorph := _gsSqueakTemp_morph trailMorph) notNil])
		ifTrue: [_gsSqueakTemp_tfm := _gsSqueakTemp_morph owner transformFrom: _gsSqueakTemp_trailMorph.
			_gsSqueakTemp_trailMorph
				notePenDown: penDown
				forPlayer: self
				at: (_gsSqueakTemp_tfm localPointToGlobal: _gsSqueakTemp_morph referencePosition)]