private
invokeMenu: evt 
	"Invoke my menu in response to the given event."
	| _gsSqueakTemp_menu |
	_gsSqueakTemp_menu := self getMenu: evt shiftPressed.
	_gsSqueakTemp_menu
		ifNotNil: [_gsSqueakTemp_menu popUpEvent: evt in: self world]