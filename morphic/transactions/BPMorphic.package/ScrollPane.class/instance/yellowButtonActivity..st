scroll bar events
yellowButtonActivity: shiftKeyState 
	(self getMenu: shiftKeyState)
		ifNotNil: [:_gsSqueakTemp_menu | 
			_gsSqueakTemp_menu setInvokingView: self.
			_gsSqueakTemp_menu popUpEvent: self activeHand lastEvent in: self world]