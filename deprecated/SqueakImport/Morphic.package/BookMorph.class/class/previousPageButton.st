scripting
previousPageButton
	"Answer a button that will take the user to the previous page of its
	enclosing book"
	| aButton |
	aButton := ThreePhaseButtonMorph labelSymbol: #PrevPage.
	aButton target: aButton.
	aButton actionSelector: #previousOwnerPage.
	aButton arguments: #().
	aButton setNameTo: 'previous'.
	^ aButton