initialization
initialize
	"initialize the state of the receiver"
	| _gsSqueakTemp_f |
	super initialize.
	""
	_gsSqueakTemp_f := Form extent: 60 @ 80 depth: Display depth.
	_gsSqueakTemp_f fill: _gsSqueakTemp_f boundingBox fillColor: color.
	self form: _gsSqueakTemp_f