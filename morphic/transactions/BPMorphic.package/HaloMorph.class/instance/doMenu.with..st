private
doMenu: evt with: menuHandle 
	"Ask hand to invoke the halo menu for my inner target."
	| _gsSqueakTemp_menu |
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: nil.
	self world displayWorld.
	_gsSqueakTemp_menu := innerTarget buildHandleMenu: evt hand.
	innerTarget addTitleForHaloMenu: _gsSqueakTemp_menu.
	_gsSqueakTemp_menu popUpEvent: evt in: self world