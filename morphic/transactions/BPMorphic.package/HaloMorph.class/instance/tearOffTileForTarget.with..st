handles
tearOffTileForTarget: evt with: aHandle 
	"Tear off a tile representing my inner target. If shift key is down, open
	up an instance browser on the morph itself, not the player, with tiles
	showing, instead"
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: nil.
	innerTarget tearOffTile