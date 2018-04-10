slot getters/setters
getIsUnderMouse
	"Answer true or false, depending on whether the object currently is or
	is not under the mouse"
	costume isInWorld
		ifFalse: [^ false].
	^ costume
		containsPoint: (costume pointFromWorld: costume primaryHand lastEvent cursorPoint)