focus
passivate
	"Reconfigure my focus according to preferences."
	self isActive
		ifFalse: [^ self].
	self isActive: false.
	self isCollapsed
		ifFalse: [model modelSleep].
	self
		submorphsDo: [:each | each lock].
	self activeHand keyboardFocus
		ifNotNil: [:morph | morph containingWindow == self
				ifTrue: [self activeHand releaseKeyboardFocus]].
	self lookUnfocused