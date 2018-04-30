other
restoreAfter: aBlock
	"Evaluate the block, wait for a mouse click, and then restore the screen."

	aBlock ensure: [
		Sensor waitButton.
		self restore].