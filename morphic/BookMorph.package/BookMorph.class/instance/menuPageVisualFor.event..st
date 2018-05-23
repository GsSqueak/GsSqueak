menu
menuPageVisualFor: target event: evt 
	| _gsSqueakTemp_tSpec _gsSqueakTemp_menu |
	_gsSqueakTemp_tSpec := self transitionSpecFor: target.
	_gsSqueakTemp_menu := (MenuMorph
				entitled: ('Choose an effect
(it is now {1})' translated format: {_gsSqueakTemp_tSpec second asString translated}))
				defaultTarget: target.
	TransitionMorph allEffects
		do: [:effect | 
			| subMenu directionChoices |
			directionChoices := TransitionMorph directionsForEffect: effect.
			directionChoices isEmpty
				ifTrue: [_gsSqueakTemp_menu
						add: effect asString translated
						target: target
						selector: #setProperty:toValue:
						argumentList: (Array
								with: #transitionSpec
								with: (Array
										with: _gsSqueakTemp_tSpec first
										with: effect
										with: #none))]
				ifFalse: [subMenu := MenuMorph new.
					directionChoices
						do: [:dir | subMenu
								add: dir asString translated
								target: target
								selector: #setProperty:toValue:
								argumentList: (Array
										with: #transitionSpec
										with: (Array
												with: _gsSqueakTemp_tSpec first
												with: effect
												with: dir))].
					_gsSqueakTemp_menu add: effect asString translated subMenu: subMenu]].
	_gsSqueakTemp_menu popUpEvent: evt in: self world