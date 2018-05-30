initialization
stationarySetup
	"Set up event handlers for mouse actions.  Should be spelled stationery..."

	self actWhen: #startDrag.
	self cornerStyle: #rounded.
	self borderNormal.
	self on: #mouseEnter send: #borderThick to: self.
	self on: #mouseDown send: nil to: nil.
	self on: #mouseLeave send: #borderNormal to: self.
	self on: #mouseLeaveDragging send: #borderNormal to: self.
	self on: #mouseUp send: #borderThick to: self.

	self on: #click send: #launchPartFromClick to: self