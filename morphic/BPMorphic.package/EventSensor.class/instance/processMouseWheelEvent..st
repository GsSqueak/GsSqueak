private-I/O
processMouseWheelEvent: evt 
	"process a mouse wheel event, updating EventSensor state"
	| _gsSqueakTemp_modifiers _gsSqueakTemp_buttons _gsSqueakTemp_mapped |
	mouseWheelDelta := (evt at: 3)
				@ (evt at: 4).
	_gsSqueakTemp_buttons := evt at: 5.
	_gsSqueakTemp_modifiers := evt at: 6.
	_gsSqueakTemp_mapped := self mapButtons: _gsSqueakTemp_buttons modifiers: _gsSqueakTemp_modifiers.
	mouseButtons := _gsSqueakTemp_mapped
				bitOr: (_gsSqueakTemp_modifiers bitShift: 3)