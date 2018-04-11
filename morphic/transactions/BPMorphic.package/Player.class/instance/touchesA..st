misc
touchesA: aPrototypicalPlayer 
	"Answer whether the receiver overlaps any player who wears a Sketch
	costume and who is of the same class as the prototypicalPlayer and
	who is wearing the same bitmap, but who is *not that player itself*!
	This is an extreme case of a function highly customized (by Bob
	Arning) to suit a single, idiosycratic, and narrow demo need of Alan's.
	Consult: http://groups.yahoo.com/group/squeak/message/40560"
	| _gsSqueakTemp_envelope _gsSqueakTemp_trueGoal _gsSqueakTemp_trueSelf |
	aPrototypicalPlayer
		ifNil: [^ false].
	_gsSqueakTemp_envelope := costume owner
				ifNil: [^ false].
	_gsSqueakTemp_trueSelf := costume renderedMorph.
	_gsSqueakTemp_trueGoal := aPrototypicalPlayer costume renderedMorph.
	_gsSqueakTemp_envelope submorphs
		do: [:each | 
			| trueNeighbor |
			trueNeighbor := each renderedMorph.
			(trueNeighbor == _gsSqueakTemp_trueGoal
					or: [trueNeighbor == _gsSqueakTemp_trueSelf])
				ifFalse: [each player
						ifNotNil: [:itsPlayer | (itsPlayer overlaps: self)
								ifTrue: [(_gsSqueakTemp_trueGoal appearsToBeSameCostumeAs: trueNeighbor)
										ifTrue: [^ true]]]]].
	^ false