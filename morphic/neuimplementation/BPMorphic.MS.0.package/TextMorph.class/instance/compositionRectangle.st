private
compositionRectangle
	| _gsSqueakTemp_compRect |
	_gsSqueakTemp_compRect := self innerBounds.
	margins
		ifNotNil: [_gsSqueakTemp_compRect := _gsSqueakTemp_compRect insetBy: margins].
	_gsSqueakTemp_compRect width < 9
		ifTrue: [_gsSqueakTemp_compRect := _gsSqueakTemp_compRect withWidth: 9].
	_gsSqueakTemp_compRect height < 16
		ifTrue: [_gsSqueakTemp_compRect := _gsSqueakTemp_compRect withHeight: 16].
	^ _gsSqueakTemp_compRect