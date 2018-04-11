focus
updateFocusLookForKeyboardFocus
	| _gsSqueakTemp_f _gsSqueakTemp_w |
	(((_gsSqueakTemp_f := self activeHand keyboardFocus) notNil
				and: [(_gsSqueakTemp_w := _gsSqueakTemp_f containingWindow) notNil])
			and: [_gsSqueakTemp_w isActive])
		ifTrue: [(self class windowsIn: self world)
				do: [:window | _gsSqueakTemp_w ~~ window
						ifTrue: [window lookUnfocused]].
			_gsSqueakTemp_w lookFocused]