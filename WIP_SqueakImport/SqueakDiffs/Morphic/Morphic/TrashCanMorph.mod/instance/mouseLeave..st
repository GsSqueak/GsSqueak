event handling
mouseLeave: event
	"Present feedback for aborted deletion."
	| hand |
	hand := event hand.
	((hand submorphCount > 0) and:
	 [hand submorphs first ~~ self])
		ifTrue:
			[SoundService soundEnabled ifTrue: [self class playMouseLeaveSound].
			hand visible: true.
			self state: #off]
		ifFalse:
			[self stopShowingStampIn: hand].
