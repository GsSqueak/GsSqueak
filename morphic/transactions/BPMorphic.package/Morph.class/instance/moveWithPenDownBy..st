-Etoys
moveWithPenDownBy: delta 
	"If this is a costume for a player with its pen down, draw a line."
	| _gsSqueakTemp_tfm _gsSqueakTemp_start _gsSqueakTemp_tfmEnd |
	self trailMorph
		ifNotNil: [:_gsSqueakTemp_trailMorph | 
			_gsSqueakTemp_tfm := self owner transformFrom: _gsSqueakTemp_trailMorph.
			_gsSqueakTemp_start := self referencePosition.
			_gsSqueakTemp_trailMorph batchPenTrails
				ifTrue: [_gsSqueakTemp_trailMorph
						notePenDown: true
						forPlayer: self player
						at: (_gsSqueakTemp_tfm localPointToGlobal: _gsSqueakTemp_start)]
				ifFalse: [_gsSqueakTemp_trailMorph
						drawPenTrailFor: self
						from: (_gsSqueakTemp_tfm localPointToGlobal: _gsSqueakTemp_start)
						to: (_gsSqueakTemp_tfmEnd := _gsSqueakTemp_tfm localPointToGlobal: _gsSqueakTemp_start + delta).
					_gsSqueakTemp_trailMorph noteNewLocation: _gsSqueakTemp_tfmEnd forPlayer: self player]]