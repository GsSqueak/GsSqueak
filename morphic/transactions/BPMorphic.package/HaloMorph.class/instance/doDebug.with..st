private
doDebug: evt with: menuHandle 
	"Ask hand to invoke the a debugging menu for my inner target. If shift
	key is down, immediately put up an inspector on the inner target"
	| _gsSqueakTemp_menu |
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: nil.
	self world displayWorld.
	evt shiftPressed
		ifTrue: [self delete.
			^ innerTarget inspectInMorphic: evt].
	_gsSqueakTemp_menu := innerTarget buildDebugMenu: evt hand.
	_gsSqueakTemp_menu
		addTitle: (innerTarget externalName truncateWithElipsisTo: 40).
	_gsSqueakTemp_menu popUpEvent: evt in: self world