event handling
keyboardFocusChange: weHaveFocus 
	paragraph
		ifNotNil: [:para | para focused: weHaveFocus].
	weHaveFocus
		ifTrue: ["A hand is wanting to send us characters..."
			self hasFocus
				ifFalse: [self editor
					"Forces install"].
			Editor blinkingCursor
				ifTrue: [self startBlinking]
				ifFalse: [self resetBlinkCursor
					"ensure caret visible"]]
		ifFalse: ["A hand has clicked elsewhere..."
			self world
				ifNotNil: [:w | 
					self flag: #suspicious.
					"mt: Why should this be called with 'false' if a hand
					holds on the focus? Do hands not talk to each other
					before sending this call? They should..."
					w
						handsDo: [:h | h keyboardFocus == self
								ifTrue: [^ self]].
					"Release control unless some hand is still holding on"
					self releaseEditor].
			self stopBlinking]