slot getters/setters
getX
	"emergency patch; unclear why not needed in getY; in any case, have
	removed the getX/getY retrievals from the viewer in 2.0-final anyway"
	| _gsSqueakTemp_aCostume |
	(_gsSqueakTemp_aCostume := self costume) isInWorld
		ifFalse: [^ 100].
	^ _gsSqueakTemp_aCostume x