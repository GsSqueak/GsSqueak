internal interpreter access
popPos32BitInteger
	"May set successFlag, and return false if not valid"
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := self popStack.
	^ self positive32BitValueOf: _gsSqueakTemp_top