initialization
initialize
"initialize the state of the receiver"
	super initialize.
	self contents: 'PopUpChoice of Colors'.
	target := Color.
	actionSelector := nil.
	arguments := Array empty.
	getItemsSelector := #colorNames.
	getItemsArgs := Array empty