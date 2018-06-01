menu messages
spawn
	"Create and schedule a message browser for the code of the model's 
	selected message. Retain any edits that have not yet been accepted."
	| _gsSqueakTemp_code |
	_gsSqueakTemp_code := paragraph text string.
	self cancel.
	model spawn: _gsSqueakTemp_code