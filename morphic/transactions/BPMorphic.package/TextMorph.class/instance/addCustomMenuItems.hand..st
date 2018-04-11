menu
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	| _gsSqueakTemp_outer |
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'text properties...' translated action: #changeTextColor.
	aCustomMenu
		addUpdating: #autoFitString
		target: self
		action: #autoFitOnOff.
	aCustomMenu
		addUpdating: #wrapString
		target: self
		action: #wrapOnOff.
	aCustomMenu add: 'text margins...' translated action: #changeMargins:.
	aCustomMenu add: 'add predecessor' translated action: #addPredecessor:.
	aCustomMenu add: 'add successor' translated action: #addSuccessor:.
	_gsSqueakTemp_outer := self owner.
	_gsSqueakTemp_outer
		ifNotNil: [_gsSqueakTemp_outer isLineMorph
				ifTrue: [container isNil
						ifTrue: [Smalltalk
								at: #TextOnCurveContainer
								ifPresent: [:ignored | aCustomMenu add: 'follow owner''s curve' translated action: #followCurve]]
						ifFalse: [aCustomMenu add: 'reverse direction' translated action: #reverseCurveDirection.
							aCustomMenu add: 'set baseline' translated action: #setCurveBaseline:]]
				ifFalse: [self fillsOwner
						ifTrue: [aCustomMenu add: 'rectangular bounds' translated action: #fillingOnOff]
						ifFalse: [aCustomMenu add: 'fill owner''s shape' translated action: #fillingOnOff].
					self avoidsOcclusions
						ifTrue: [aCustomMenu add: 'ignore occlusions' translated action: #occlusionsOnOff]
						ifFalse: [aCustomMenu add: 'avoid occlusions' translated action: #occlusionsOnOff]]].
	aCustomMenu addLine.
	aCustomMenu add: 'holder for characters' translated action: #holderForCharacters