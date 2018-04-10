event handling
mouseEnter: event 
	"Present feedback for potential deletion."
	| _gsSqueakTemp_hand _gsSqueakTemp_firstSub |
	_gsSqueakTemp_hand := event hand.
	((_gsSqueakTemp_hand submorphCount > 0
				and: [(_gsSqueakTemp_firstSub := _gsSqueakTemp_hand submorphs first) ~~ self])
			and: [self wantsDroppedMorph: _gsSqueakTemp_firstSub event: event])
		ifTrue: [SoundService soundEnabled
				ifTrue: [self class playMouseEnterSound].
			"hand visible: false."
			"This leads to confusion. Let morph and hand appear til
			dropped. "
			"self world abandonAllHalos."
			"hand halo: nil."
			self state: #pressed]
		ifFalse: [self showStampIn: _gsSqueakTemp_hand]