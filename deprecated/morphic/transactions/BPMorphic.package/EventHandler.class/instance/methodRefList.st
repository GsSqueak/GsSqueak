access
methodRefList
	"Return a MethodReference for each message I can send. tk 9/13/97,
	raa 
	5/29/01"
	| _gsSqueakTemp_list _gsSqueakTemp_adder |
	_gsSqueakTemp_list := SortedCollection new.
	_gsSqueakTemp_adder := [:recip :sel | recip
				ifNotNil: [_gsSqueakTemp_list
						add: (MethodReference new
								class: (recip class whichClassIncludesSelector: sel)
								selector: sel)]].
	_gsSqueakTemp_adder value: mouseDownRecipient value: mouseDownSelector.
	_gsSqueakTemp_adder value: mouseMoveRecipient value: mouseMoveSelector.
	_gsSqueakTemp_adder value: mouseStillDownRecipient value: mouseStillDownSelector.
	_gsSqueakTemp_adder value: mouseUpRecipient value: mouseUpSelector.
	_gsSqueakTemp_adder value: mouseEnterRecipient value: mouseEnterSelector.
	_gsSqueakTemp_adder value: mouseLeaveRecipient value: mouseLeaveSelector.
	_gsSqueakTemp_adder value: mouseEnterDraggingRecipient value: mouseEnterDraggingSelector.
	_gsSqueakTemp_adder value: mouseLeaveDraggingRecipient value: mouseLeaveDraggingSelector.
	_gsSqueakTemp_adder value: doubleClickRecipient value: doubleClickSelector.
	_gsSqueakTemp_adder value: keyStrokeRecipient value: keyStrokeSelector.
	^ _gsSqueakTemp_list