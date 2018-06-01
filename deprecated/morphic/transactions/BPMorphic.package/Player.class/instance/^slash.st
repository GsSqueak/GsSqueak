scripts-vector
/ aNumber 
	"Treating Players like vectors, return a new Player that is myself
	divided by the number"
	| _gsSqueakTemp_new |
	_gsSqueakTemp_new := costume usableSiblingInstance player.
	_gsSqueakTemp_new setX: self getX / aNumber asPoint x.
	_gsSqueakTemp_new setY: self getY / aNumber asPoint y.
	^ _gsSqueakTemp_new