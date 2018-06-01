events
keyStroke: anEvent 
	self resetTypeAhead; deselect.
	(self dispatchOnKeyboardEvent: anEvent)
		ifTrue: [self closeTypeIn.
			self storeSelectionInParagraph.
			^ self].
	self openTypeIn.
	self zapSelectionWith: self typeAhead contents;
		 resetTypeAhead;
		 unselect;
		 storeSelectionInParagraph