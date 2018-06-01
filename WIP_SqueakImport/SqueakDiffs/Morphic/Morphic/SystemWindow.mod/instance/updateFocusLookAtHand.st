focus
updateFocusLookAtHand
	"If there is more than one active window, look for the mouse cursor and update the window focus look accordingly. This method is not on the class-side because we need our world and some active hand."
	
	(model windowActiveOnFirstClick and: [Preferences mouseOverForKeyboardFocus])
		ifFalse: [self updateFocusLookForKeyboardFocus]
		 ifTrue: [
			((self class windowsIn: self world)
				do: [:window | window lookUnfocused];
				select: [:window | window bounds containsPoint: self activeHand position])
					ifNotEmpty: [:windowsPointed | windowsPointed first lookFocused "only to foremost window"]].