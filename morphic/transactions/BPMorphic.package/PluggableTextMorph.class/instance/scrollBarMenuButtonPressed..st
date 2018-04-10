scroll bar events
scrollBarMenuButtonPressed: event 
	"The menu button in the scrollbar was pressed; put up the menu"
	(self getMenu: event shiftPressed)
		ifNotNil: [:_gsSqueakTemp_menu | 
			"Set up to use perform:orSendTo: for model/view dispatch"
			_gsSqueakTemp_menu setInvokingView: self.
			_gsSqueakTemp_menu invokeModal]