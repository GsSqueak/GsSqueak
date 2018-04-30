scripting
authoringPrototype
	"Answer an instance of the receiver suitable for placing in a parts bin
	for authors"
	| _gsSqueakTemp_book |
	_gsSqueakTemp_book := self new initializeToStandAlone.
	_gsSqueakTemp_book markAsPartsDonor.
	^ _gsSqueakTemp_book