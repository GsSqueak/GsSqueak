private
dismiss
	"Remove my target from the world Seems to be EToy specific."

	| w |
	w := self world.
	w ifNotNil: [w stopStepping: target].
	self delete.
	target dismissViaHalo