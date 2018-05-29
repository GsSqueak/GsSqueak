event handling
endColorSelection: evt
	"Update current color and report it to paint box."

	self selectColor: evt.
	"restore mouseLeave handling"
	self on: #mouseLeave send: #delete to: self.
