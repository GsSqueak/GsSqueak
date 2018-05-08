mouse
mouseButtons
	"Answer a number from 0 to 7 that encodes the state of the three mouse buttons in its lowest 3 bits."

	^ self peekButtons bitAnd: 7
