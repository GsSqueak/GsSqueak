menu
menuPageSoundFor: target event: evt
	| tSpec menu |
	tSpec := self transitionSpecFor: target.
	menu := (MenuMorph entitled: 'Choose a sound
(it is now ' translated, tSpec first translated, ')') defaultTarget: target.
	SoundService default sampledSoundChoices do:
		[:soundName |
		menu add: soundName translated target: target
			selector: #setProperty:toValue:
			argumentList: (Array with: #transitionSpec
								with: (tSpec copy at: 1 put: soundName; yourself))].

	menu popUpEvent: evt in: self world