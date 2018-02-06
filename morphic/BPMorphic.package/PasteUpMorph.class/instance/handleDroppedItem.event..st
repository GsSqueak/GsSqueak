event handling
handleDroppedItem: anItem event: anEvent 
	(ExternalDropHandler lookupExternalDropHandler: anItem)
		ifNotNil: [:handler | handler
				handle: anItem
				in: self
				dropEvent: anEvent]