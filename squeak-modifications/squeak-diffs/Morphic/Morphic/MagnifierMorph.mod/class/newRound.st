instance creation
newRound
	"Answer a round Magnifier"

	| aMagnifier sm |
	aMagnifier := self new.
	sm := ScreeningMorph new position: aMagnifier position.
	sm addMorph: aMagnifier.
	sm addMorph: (EllipseMorph newBounds: aMagnifier bounds).
	sm setNameTo: 'Magnifier'.
	^ sm