I/O primitives
primitiveMousePoint
	"Obsolete on virtually all platforms; old style input polling code.
	Return a Point indicating current position of the mouse. Note that
	mouse coordinates may be negative if the mouse moves above or to
	the left of the top-left corner of the Smalltalk window."
	| _gsSqueakTemp_pointWord _gsSqueakTemp_x _gsSqueakTemp_y |
	_gsSqueakTemp_pointWord := self ioMousePoint.
	_gsSqueakTemp_x := self
				signExtend16: (_gsSqueakTemp_pointWord >> 16 bitAnd: 65535).
	_gsSqueakTemp_y := self
				signExtend16: (_gsSqueakTemp_pointWord bitAnd: 65535).
	self
		pop: 1
		thenPush: (self makePointwithxValue: _gsSqueakTemp_x yValue: _gsSqueakTemp_y)