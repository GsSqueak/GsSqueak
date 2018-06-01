private
addHandleAt: aPoint color: aColor icon: iconName on: eventName send: selector to: recipient 
	"Add a handle centered at the given point with the given color, 
	and set it up to respond to the given event by sending the 
	given selector to the given recipient. Return the handle."
	| _gsSqueakTemp_handle |
	_gsSqueakTemp_handle := self
				createHandleAt: aPoint
				color: (aColor alpha: 0.8)
				iconName: iconName.
	self addMorph: _gsSqueakTemp_handle.
	_gsSqueakTemp_handle
		on: #mouseUp
		send: #endInteraction
		to: self.
	_gsSqueakTemp_handle
		on: eventName
		send: selector
		to: recipient.
	_gsSqueakTemp_handle setBalloonText: (target balloonHelpTextForHandle: _gsSqueakTemp_handle) translated.
	^ _gsSqueakTemp_handle