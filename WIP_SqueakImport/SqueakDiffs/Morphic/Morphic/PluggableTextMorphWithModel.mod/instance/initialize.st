initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	self
		on: self
		text: #getMyText
		accept: #setMyText:
		readSelection: nil
		menu: nil