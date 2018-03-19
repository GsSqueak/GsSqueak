-Etoys-scripting
tearOffTile
	"Tear off a tile representing the player associated with the receiver.
	This is obtained from the top renderer"
	^ self topRendererOrSelf assuredPlayer tearOffTileForSelf