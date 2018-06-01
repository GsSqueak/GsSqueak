other
addAtoms: n
	"Add a bunch of new atoms."

	n timesRepeat: [
		| a |
		a := AtomMorph new.
		a randomPositionIn: bounds maxVelocity: 10.
		self addMorph: a].
	self stopStepping.
