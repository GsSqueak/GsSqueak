I/O primitive support
ioBeDisplay: bitsOrHandle width: width height: height depth: depth 
	"Record the position and dimensions of the display bitmap, and inform
	the display subsystem of the installation of a new display bitmap."
	| _gsSqueakTemp_changed |
	_gsSqueakTemp_changed := displayBits ~= bitsOrHandle.
	displayBits := bitsOrHandle.
	displayWidth := width.
	displayHeight := height.
	displayDepth := depth.
	self
		ioNoteDisplayChanged: bitsOrHandle
		width: width
		height: height
		depth: depth