editing keys
exchange: eKeyboardEvent 
	"Exchange the current and prior selections. Keeps typeahead."
	self insertAndCloseTypeIn.
	self exchange.
	^ true