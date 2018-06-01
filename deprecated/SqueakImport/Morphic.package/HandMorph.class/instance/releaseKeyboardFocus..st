focus handling
releaseKeyboardFocus: aMorph
	"If the given morph had the keyboard focus before, release it"
	self keyboardFocus == aMorph keyboardFocusDelegate
		ifTrue:[self releaseKeyboardFocus].