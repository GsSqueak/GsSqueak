menu
menuPageSoundFor: target event: evt 
	| _gsSqueakTemp_tSpec _gsSqueakTemp_menu |
	_gsSqueakTemp_tSpec := self transitionSpecFor: target.
	_gsSqueakTemp_menu := (MenuMorph entitled: 'Choose a sound
(it is now ' translated , _gsSqueakTemp_tSpec first translated , ')')
				defaultTarget: target.
	SoundService default sampledSoundChoices
		do: [:soundName | _gsSqueakTemp_menu
				add: soundName translated
				target: target
				selector: #setProperty:toValue:
				argumentList: (Array with: #transitionSpec with: (_gsSqueakTemp_tSpec copy at: 1 put: soundName;
							 yourself))].
	_gsSqueakTemp_menu popUpEvent: evt in: self world