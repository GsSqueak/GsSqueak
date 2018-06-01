scripting
nextPageButton
	"Answer a button that will take the user to the next page of its
	enclosing book"
	| aButton |
	aButton := ThreePhaseButtonMorph labelSymbol: #NextPage.
	aButton target: aButton.
	aButton actionSelector: #nextOwnerPage.
	aButton arguments: #().
	aButton setNameTo: 'previous'.
	^ aButton