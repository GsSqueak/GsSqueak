scroll bar events
yellowButtonActivity: shiftKeyState
	| menu |
	(menu := self getMenu: shiftKeyState) ifNotNil:
		[menu setInvokingView: self.
		menu popUpEvent: self activeHand lastEvent in: self world]