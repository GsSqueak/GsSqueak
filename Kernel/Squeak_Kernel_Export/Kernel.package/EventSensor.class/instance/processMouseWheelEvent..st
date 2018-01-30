private-I/O
processMouseWheelEvent: evt
	"process a mouse wheel event, updating EventSensor state"
	
	| modifiers buttons mapped |
	mouseWheelDelta := (evt at: 3) @ (evt at: 4).
	buttons := evt at: 5.
	modifiers := evt at: 6.
	mapped := self mapButtons: buttons modifiers: modifiers.
	mouseButtons := mapped bitOr: (modifiers bitShift: 3).