private
addGraphicalHandle: formKey at: aPoint on: eventName send: selector to: recipient 
	"Add the supplied form as a graphical handle centered at the given
	point, and set it up to respond to the given event by sending the
	given selector to the given recipient. Return the handle."
	| _gsSqueakTemp_handle |
	_gsSqueakTemp_handle := self addGraphicalHandleFrom: formKey at: aPoint.
	_gsSqueakTemp_handle
		on: eventName
		send: selector
		to: recipient.
	_gsSqueakTemp_handle setBalloonText: (target balloonHelpTextForHandle: _gsSqueakTemp_handle) translated.
	^ _gsSqueakTemp_handle