modal control
invokeModalAt: aPoint in: aWorld allowKeyboard: aBoolean 
	"Invoke this menu and don't return until the user has chosen a value.
	See senders of this method for finding out how to use modal menu
	morphs. "
	| _gsSqueakTemp_w _gsSqueakTemp_originalFocusHolder |
	_gsSqueakTemp_originalFocusHolder := aWorld primaryHand keyboardFocus.
	self
		popUpAt: aPoint
		forHand: aWorld primaryHand
		in: aWorld
		allowKeyboard: aBoolean.
	self isModalInvokationDone: false.
	_gsSqueakTemp_w := aWorld outermostWorldMorph.
	"containing hand"
	[self isInWorld & self isModalInvokationDone not]
		whileTrue: [_gsSqueakTemp_w doOneSubCycle].
	self delete.
	_gsSqueakTemp_originalFocusHolder
		ifNotNil: [aWorld primaryHand newKeyboardFocus: _gsSqueakTemp_originalFocusHolder].
	^ self modalSelection