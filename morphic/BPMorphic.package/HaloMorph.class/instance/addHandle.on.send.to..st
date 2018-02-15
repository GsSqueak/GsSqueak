private
addHandle: handleSpec on: eventName send: selector to: recipient 
	"Add a handle within the halo box as per the haloSpec, and set 
	it up to respond to the given event by sending the given 
	selector to the given recipient. Return the handle."
	| _gsSqueakTemp_handle _gsSqueakTemp_aPoint |
	_gsSqueakTemp_aPoint := self
				positionIn: haloBox
				horizontalPlacement: handleSpec horizontalPlacement
				verticalPlacement: handleSpec verticalPlacement.
	_gsSqueakTemp_handle := self
				addHandleAt: _gsSqueakTemp_aPoint
				color: (Color colorFrom: handleSpec color)
				icon: handleSpec iconSymbol
				on: eventName
				send: selector
				to: recipient.
	self isMagicHalo
		ifTrue: [_gsSqueakTemp_handle
				on: #mouseEnter
				send: #handleEntered
				to: self.
			_gsSqueakTemp_handle
				on: #mouseLeave
				send: #handleLeft
				to: self].
	^ _gsSqueakTemp_handle