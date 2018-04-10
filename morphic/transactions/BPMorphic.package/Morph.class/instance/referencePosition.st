-Etoys-geometry
referencePosition
	"Return the current reference position of the receiver"
	| _gsSqueakTemp_box |
	_gsSqueakTemp_box := self bounds.
	^ _gsSqueakTemp_box origin + (self rotationCenter * _gsSqueakTemp_box extent)