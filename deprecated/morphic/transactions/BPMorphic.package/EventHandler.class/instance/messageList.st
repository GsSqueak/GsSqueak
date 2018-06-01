access
messageList
	"Return a list of 'Class selector' for each message I can send. tk 
	9/13/97"
	| _gsSqueakTemp_list |
	self flag: #mref.
	"is this still needed? I replaced the one use that I could spot with 
	#methodRefList"
	_gsSqueakTemp_list := SortedCollection new.
	mouseDownRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseDownRecipient class whichClassIncludesSelector: mouseDownSelector) name , ' ' , mouseDownSelector].
	mouseMoveRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseMoveRecipient class whichClassIncludesSelector: mouseMoveSelector) name , ' ' , mouseMoveSelector].
	mouseStillDownRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseStillDownRecipient class whichClassIncludesSelector: mouseStillDownSelector) name , ' ' , mouseStillDownSelector].
	mouseUpRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseUpRecipient class whichClassIncludesSelector: mouseUpSelector) name , ' ' , mouseUpSelector].
	mouseEnterRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseEnterRecipient class whichClassIncludesSelector: mouseEnterSelector) name , ' ' , mouseEnterSelector].
	mouseLeaveRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseLeaveRecipient class whichClassIncludesSelector: mouseLeaveSelector) name , ' ' , mouseLeaveSelector].
	mouseEnterDraggingRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseEnterDraggingRecipient class whichClassIncludesSelector: mouseEnterDraggingSelector) name , ' ' , mouseEnterDraggingSelector].
	mouseLeaveDraggingRecipient
		ifNotNil: [_gsSqueakTemp_list add: (mouseLeaveDraggingRecipient class whichClassIncludesSelector: mouseLeaveDraggingSelector) name , ' ' , mouseLeaveDraggingSelector].
	doubleClickRecipient
		ifNotNil: [_gsSqueakTemp_list add: (doubleClickRecipient class whichClassIncludesSelector: doubleClickSelector) name , ' ' , doubleClickSelector].
	keyStrokeRecipient
		ifNotNil: [_gsSqueakTemp_list add: (keyStrokeRecipient class whichClassIncludesSelector: keyStrokeSelector) name , ' ' , keyStrokeSelector].
	^ _gsSqueakTemp_list