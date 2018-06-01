traits
defineTrait: defString notifying: aController  

	super defineTrait: defString notifying: aController.
	self updateAfterClassChange.