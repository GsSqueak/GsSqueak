focus
passivate
	"A passive window's contents do not handle user input events until being activated, for example, by a single extra mouse click. There is a preference to configure whether windows can be passive at all. Also see #activate and #lookUnfocused."

	self isActive ifFalse: [^ self].
	self isActive: false.
	
	self isCollapsed ifFalse: [model modelSleep].

	self submorphsDo: [:each | each lock].

	self activeHand keyboardFocus ifNotNil: [:morph |
		morph containingWindow == self
			ifTrue: [self activeHand releaseKeyboardFocus]].

	self lookUnfocused.