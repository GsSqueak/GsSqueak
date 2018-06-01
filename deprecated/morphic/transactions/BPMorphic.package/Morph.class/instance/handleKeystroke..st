events-processing
handleKeystroke: anEvent 
	"System level event handling. Has support for automatically grabbing
	the keyboard focus considering the keyboard focus delegate. See
	#newKeyboardFocus: "
	| handler |
	anEvent wasHandled
		ifTrue: [^ self].
	(self handlesKeyboard: anEvent)
		ifFalse: [^ self].
	handler := self wantsKeyboardFocus
				ifTrue: [(anEvent hand newKeyboardFocus: self)
						ifNil: [self]]
				ifFalse: [self].
	anEvent handler: handler.
	anEvent wasHandled: true.
	^ handler keyStroke: anEvent