private
doDebug: evt with: menuHandle
	"Ask hand to invoke the a debugging menu for my inner target.  If shift key is down, immediately put up an inspector on the inner target"

	| menu |
	evt shiftPressed ifTrue: [
		evt hand removeHalo.
		^ innerTarget inspectInMorphic: evt].

	menu := innerTarget buildDebugMenu: evt hand.
	menu addTitle: (innerTarget externalName truncateWithElipsisTo: 40).
	menu popUpEvent: evt in: self world.
	evt hand removeHalo.