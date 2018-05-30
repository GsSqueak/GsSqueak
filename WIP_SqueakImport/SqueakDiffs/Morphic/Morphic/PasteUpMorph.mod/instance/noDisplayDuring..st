world state
noDisplayDuring: block
	"Some morphs insist on updating the display like the system progress bar does. However, some code might be in an inconsistent state. For this, you can use this method to be safe."

	self
		setProperty: #shouldDisplayWorld
		toValue: false.
		
	block ensure: [self removeProperty: #shouldDisplayWorld].