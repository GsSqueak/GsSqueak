scripts-standard
overlapsAny: aPlayer 
	"Answer true if my costume overlaps that of aPlayer, or any of its 
	siblings (if aPlayer is a scripted player) 
	or if my costume overlaps any morphs of the same class (if aPlayer is 
	unscripted)."
	| _gsSqueakTemp_possibleCostumes _gsSqueakTemp_itsCostumeClass _gsSqueakTemp_myShadow |
	(self ~= aPlayer
			and: [self overlaps: aPlayer])
		ifTrue: [^ true].
	_gsSqueakTemp_possibleCostumes := IdentitySet new.
	aPlayer belongsToUniClass
		ifTrue: [aPlayer class
				allSubInstancesDo: [:anInstance | | itsCostume | (anInstance ~~ aPlayer
							and: [itsCostume := anInstance costume.
								(itsCostume bounds intersects: costume bounds)
									and: [itsCostume world == costume world]])
						ifTrue: [_gsSqueakTemp_possibleCostumes add: itsCostume]]]
		ifFalse: [_gsSqueakTemp_itsCostumeClass := aPlayer costume class.
			self costume world presenter allExtantPlayers
				do: [:ep | ep costume
						ifNotNil: [:ea | (ea class == _gsSqueakTemp_itsCostumeClass
									and: [ea bounds intersects: costume bounds])
								ifTrue: [_gsSqueakTemp_possibleCostumes add: ea]]]].
	_gsSqueakTemp_possibleCostumes isEmpty
		ifTrue: [^ false].
	_gsSqueakTemp_myShadow := costume shadowForm.
	^ _gsSqueakTemp_possibleCostumes
		anySatisfy: [:m | m overlapsShadowForm: _gsSqueakTemp_myShadow bounds: costume fullBounds]