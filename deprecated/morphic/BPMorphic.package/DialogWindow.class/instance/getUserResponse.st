running
getUserResponse
	| _gsSqueakTemp_hand _gsSqueakTemp_world |
	(ProvideAnswerNotification signal: self message asString)
		ifNotNil: [:answer | ^ answer = #default
				ifTrue: [result]
				ifFalse: [answer]].
	self message
		ifEmpty: [messageMorph delete].
	"Do not waste space."
	self paneMorph submorphs
		ifEmpty: [self paneMorph delete].
	"Do not waste space."
	_gsSqueakTemp_hand := self currentHand.
	_gsSqueakTemp_world := self currentWorld.
	self fullBounds.
	self center: preferredPosition.
	self
		bounds: (self bounds translatedToBeWithin: _gsSqueakTemp_world bounds).
	self openInWorld: _gsSqueakTemp_world.
	_gsSqueakTemp_hand keyboardFocus
		in: [:priorKeyboardFocus | _gsSqueakTemp_hand mouseFocus
				in: [:priorMouseFocus | 
					self exclusive
						ifTrue: [_gsSqueakTemp_hand newMouseFocus: self].
					_gsSqueakTemp_hand newKeyboardFocus: self.
					[self isInWorld]
						whileTrue: [_gsSqueakTemp_world doOneSubCycle].
					_gsSqueakTemp_hand newKeyboardFocus: priorKeyboardFocus.
					self exclusive
						ifTrue: [_gsSqueakTemp_hand newMouseFocus: priorMouseFocus]]].
	^ result