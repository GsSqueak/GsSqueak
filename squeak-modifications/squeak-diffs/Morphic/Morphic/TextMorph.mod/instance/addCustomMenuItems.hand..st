menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	| outer |
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'text properties...' translated action: #changeTextColor.
	aCustomMenu addUpdating: #autoFitString target: self action: #autoFitOnOff.
	aCustomMenu addUpdating: #wrapString target: self action: #wrapOnOff.
	aCustomMenu add: 'text margins...' translated action: #changeMargins:.
	aCustomMenu add: 'add predecessor' translated action: #addPredecessor:.
	aCustomMenu add: 'add successor' translated action: #addSuccessor:.
	
	outer := self owner.
	outer ifNotNil: [
	outer isLineMorph ifTrue:
		[container isNil
			ifTrue: [Smalltalk at: #TextOnCurveContainer ifPresent: [:ignored | aCustomMenu add: 'follow owner''s curve' translated action: #followCurve]]
			ifFalse: [aCustomMenu add: 'reverse direction' translated action: #reverseCurveDirection.
					aCustomMenu add: 'set baseline' translated action: #setCurveBaseline:]]
		ifFalse:
		[self fillsOwner
			ifFalse: [aCustomMenu add: 'fill owner''s shape' translated action: #fillingOnOff]
			ifTrue: [aCustomMenu add: 'rectangular bounds' translated action: #fillingOnOff].
		self avoidsOcclusions
			ifFalse: [aCustomMenu add: 'avoid occlusions' translated action: #occlusionsOnOff]
			ifTrue: [aCustomMenu add: 'ignore occlusions' translated action: #occlusionsOnOff]]].
	aCustomMenu addLine.
	aCustomMenu add: 'holder for characters' translated action: #holderForCharacters
