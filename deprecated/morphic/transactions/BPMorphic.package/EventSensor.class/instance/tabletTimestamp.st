tablet
tabletTimestamp
	"Answer the time (in tablet clock ticks) at which the tablet's primary
	pen last changed state. This can be used in polling loops; if this
	timestamp hasn't changed, then the pen state hasn't changed either."
	| _gsSqueakTemp_data |
	_gsSqueakTemp_data := self primTabletRead: 1.
	"state of first/primary pen"
	^ _gsSqueakTemp_data at: 2