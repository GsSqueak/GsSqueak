top window
beKeyWindowIfNeeded: evt
	"Make me the new key window if needed. Ensure that the focus look matches the keyboard focus."

	(self isKeyWindow not
		and: [self class windowsRaiseOnClick
			or: [self windowDecorations anySatisfy: [:morph | morph bounds containsPoint: evt position]] ])
				ifFalse: [
					"Just ensure the correct look after the event."
					self updateFocusLookForKeyboardFocus]
				ifTrue: [
					"We are the new key window at the front etc."
					self beKeyWindow.
					"There may have been a pop-up menu spawned. We do not want to occlude that."
					evt hand mouseFocus ifNotNil: [:morph |
						morph owner = self world ifTrue: [morph comeToFront]].
					evt hand balloonHelpList do: [:morph |
						morph comeToFront]]