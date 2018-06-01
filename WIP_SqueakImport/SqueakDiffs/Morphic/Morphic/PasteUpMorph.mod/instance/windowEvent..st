event handling
windowEvent: anEvent
	self windowEventHandler
		ifNotNil: [^self windowEventHandler windowEvent: anEvent].

	anEvent type == #windowClose
		ifTrue: [
			^Preferences eToyFriendly 
				ifTrue: [ProjectNavigationMorph basicNew quitSqueak]
				ifFalse: [TheWorldMenu basicNew quitSession]].
