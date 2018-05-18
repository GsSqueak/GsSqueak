initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	self setProperty: #autoExpand toValue: false.
	self
		on: #mouseMove
		send: #mouseStillDown:onItem:
		to: self