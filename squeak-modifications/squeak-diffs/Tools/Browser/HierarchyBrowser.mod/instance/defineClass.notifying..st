class functions
defineClass: defString notifying: aController  

	super defineClass: defString notifying: aController.
	self updateAfterClassChange.