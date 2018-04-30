scripting
nextPageButton
	"Answer a button that will take the user to the next page of its
	enclosing book"
	| _gsSqueakTemp_aButton |
	_gsSqueakTemp_aButton := ThreePhaseButtonMorph labelSymbol: #NextPage.
	_gsSqueakTemp_aButton target: _gsSqueakTemp_aButton.
	_gsSqueakTemp_aButton actionSelector: #nextOwnerPage.
	_gsSqueakTemp_aButton arguments: #().
	_gsSqueakTemp_aButton setNameTo: 'previous'.
	^ _gsSqueakTemp_aButton