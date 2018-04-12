class initialization
registerInOpenMenu
	(TheWorldMenu respondsTo: #registerOpenCommand:)
		ifTrue: [TheWorldMenu unregisterOpenCommand: 'Font Importer'.
			TheWorldMenu registerOpenCommand: {'Font Importer'. {self. #open}}]