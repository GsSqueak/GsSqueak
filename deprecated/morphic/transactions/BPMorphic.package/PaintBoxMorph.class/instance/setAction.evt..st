actions
setAction: aSelector evt: evt 
	"Find this button and turn it on. Does not work for stamps or pickups"
	| _gsSqueakTemp_button |
	_gsSqueakTemp_button := self submorphNamed: aSelector.
	_gsSqueakTemp_button
		ifNotNil: [_gsSqueakTemp_button state: #on.
			_gsSqueakTemp_button doButtonAction: evt]