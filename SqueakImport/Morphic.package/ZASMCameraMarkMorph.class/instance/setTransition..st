as yet unclassified
setTransition: evt

	| tSpec menu |

	tSpec := self 
		valueOfProperty: #transitionSpec
		ifAbsent: [
			(self valueOfProperty: #bookPage) 
				valueOfProperty: #transitionSpec
				ifAbsent: [{ 'silence' . #none. #none}]
		].
	menu := (MenuMorph entitled: 'Choose an effect
(it is now ' , tSpec second , ')') defaultTarget: self.
	TransitionMorph allEffects do: [:effect | | subMenu directionChoices |
		directionChoices := TransitionMorph directionsForEffect: effect.
		directionChoices isEmpty
		ifTrue: [menu add: effect target: self
					selector: #setProperty:toValue:
					argumentList: (Array with: #transitionSpec
									with: (Array with: tSpec first with: effect with: #none))]
		ifFalse: [subMenu := MenuMorph new.
				directionChoices do:
					[:dir |
					subMenu add: dir target: self
						selector: #setProperty:toValue:
						argumentList: (Array with: #transitionSpec
									with: (Array with: tSpec first with: effect with: dir))].
				menu add: effect subMenu: subMenu]].

	menu popUpEvent: evt in: self world