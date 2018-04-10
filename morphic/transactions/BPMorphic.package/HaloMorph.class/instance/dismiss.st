private
dismiss
	"Remove my target from the world Seems to be EToy specific."
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_w
		ifNotNil: [_gsSqueakTemp_w stopStepping: target].
	self delete.
	target dismissViaHalo