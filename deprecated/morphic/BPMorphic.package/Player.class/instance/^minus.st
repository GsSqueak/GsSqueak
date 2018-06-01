scripts-vector
- aPlayer 
	"Treating Players like vectors, subtract aPlayer from me and return a
	new Player"
	| _gsSqueakTemp_new |
	_gsSqueakTemp_new := costume usableSiblingInstance player.
	_gsSqueakTemp_new setX: self getX - aPlayer asPoint x.
	_gsSqueakTemp_new setY: self getY - aPlayer asPoint y.
	^ _gsSqueakTemp_new