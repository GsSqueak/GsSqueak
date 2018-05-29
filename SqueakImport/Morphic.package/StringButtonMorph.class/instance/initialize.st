initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	target := nil.
	actionSelector := #flash.
	arguments := Array empty.
	actWhen := #buttonUp.
	self contents: 'Flash'