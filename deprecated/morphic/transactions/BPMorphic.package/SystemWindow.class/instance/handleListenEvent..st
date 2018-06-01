events
handleListenEvent: aUserInputEvent 
	"See #mouseEnterDragging:. Watch for finished drag-and-drop action
	and lock contents accordingly."
	(aUserInputEvent isMouse
			and: [aUserInputEvent hand hasSubmorphs not])
		ifTrue: [self isKeyWindow
				ifFalse: [self passivateIfNeeded].
			aUserInputEvent hand removeMouseListener: self]