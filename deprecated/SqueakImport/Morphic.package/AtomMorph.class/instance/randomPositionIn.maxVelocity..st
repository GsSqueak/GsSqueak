initialization
randomPositionIn: aRectangle maxVelocity: maxVelocity
	"Give this atom a random position and velocity."

	| origin extent |
	origin := aRectangle origin.
	extent := (aRectangle extent - self bounds extent) rounded.
	self position:
		(origin x + extent x atRandom) @
		(origin y + extent y atRandom).
	velocity :=
		(maxVelocity - (2 * maxVelocity) atRandom) @
		(maxVelocity - (2 * maxVelocity) atRandom).
