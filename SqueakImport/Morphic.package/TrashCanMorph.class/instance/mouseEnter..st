event handling
mouseEnter: event 
	"Present feedback for potential deletion."
	| hand firstSub |
	hand := event hand.
	((hand submorphCount > 0
				and: [(firstSub := hand submorphs first) ~~ self])
			and: [self wantsDroppedMorph: firstSub event: event])
		ifTrue: [SoundService soundEnabled
				ifTrue: [self class playMouseEnterSound].
			"hand visible: false." "This leads to confusion. Let morph and hand appear til dropped."
			"self world abandonAllHalos."
			"hand halo: nil."
			self state: #pressed]
		ifFalse: [self showStampIn: hand]