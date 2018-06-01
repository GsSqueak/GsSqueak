customevents-custom events
getTriggeringObject
	"Answer the Player that is triggering the current script,
	or the default UnscriptedPlayer if none."
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := GetTriggeringObjectNotification signal.
	^ _gsSqueakTemp_rcvr
		ifNil: [self costume presenter standardPlayer]
		ifNotNil: [_gsSqueakTemp_rcvr isMorph
				ifTrue: [_gsSqueakTemp_rcvr assuredPlayer]
				ifFalse: [_gsSqueakTemp_rcvr]]