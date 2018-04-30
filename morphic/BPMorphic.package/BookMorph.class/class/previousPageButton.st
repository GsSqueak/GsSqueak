scripting
previousPageButton
	"Answer a button that will take the user to the previous page of its
	enclosing book"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := ThreePhaseButtonMorph labelSymbol: #PrevPage.
	_gsSqueakTemp_aButton target: _gsSqueakTemp_aButton.
	_gsSqueakTemp_aButton actionSelector: #previousOwnerPage.
	_gsSqueakTemp_aButton arguments: #().
	_gsSqueakTemp_aButton setNameTo: 'previous'.
	^ _gsSqueakTemp_aButton