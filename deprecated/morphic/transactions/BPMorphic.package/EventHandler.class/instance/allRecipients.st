access
allRecipients
	"Answer a list, without duplication, of all the objects serving as
	recipients to any of the events I handle. Intended for
	debugging/documentation use only"
	| _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := OrderedCollection
				with: mouseDownRecipient
				with: mouseStillDownRecipient
				with: mouseUpRecipient
				with: mouseEnterRecipient
				with: mouseLeaveRecipient.
	_gsSqueakTemp_aList
		addAll: (OrderedCollection
				with: mouseEnterDraggingRecipient
				with: mouseLeaveDraggingRecipient
				with: doubleClickRecipient
				with: keyStrokeRecipient).
	_gsSqueakTemp_aList add: mouseMoveRecipient.
	^ (_gsSqueakTemp_aList copyWithout: nil) asSet asArray