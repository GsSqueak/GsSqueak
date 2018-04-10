widgets optional
buildPluggableInputField: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self buildPluggableText: aSpec.
	_gsSqueakTemp_widget minimumHeight: 0.
	_gsSqueakTemp_widget acceptOnCR: true.
	_gsSqueakTemp_widget hideScrollBarsIndefinitely.
	^ _gsSqueakTemp_widget