focus
updateFocusLookForKeyboardFocus

	| f w |
	(((f := self activeHand keyboardFocus) notNil and: [(w := f containingWindow) notNil])
		and: [w isActive])
			ifTrue: [
				(self class windowsIn: self world) do: [:window |
					w ~~ window ifTrue: [window lookUnfocused]].
				w lookFocused]