event handling
mouseLeave: event 
	"Present feedback for aborted deletion."
	| _gsSqueakTemp_hand |
	_gsSqueakTemp_hand := event hand.
	(_gsSqueakTemp_hand submorphCount > 0
			and: [_gsSqueakTemp_hand submorphs first ~~ self])
		ifTrue: [SoundService soundEnabled
				ifTrue: [self class playMouseLeaveSound].
			_gsSqueakTemp_hand visible: true.
			self state: #off]
		ifFalse: [self stopShowingStampIn: _gsSqueakTemp_hand]