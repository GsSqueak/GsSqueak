event handling
startColorSelection: evt
	"Start color selection. Make me stay up as long as the mouse is down."

	self on: #mouseLeave send: nil to: nil.
	self selectColor: evt.
