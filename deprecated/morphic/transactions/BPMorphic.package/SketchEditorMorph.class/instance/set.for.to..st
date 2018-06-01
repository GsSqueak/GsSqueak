Nebraska support
set: aSymbol for: anEventOrHand to: anObject 
	| _gsSqueakTemp_valuesForHand |
	_gsSqueakTemp_valuesForHand := self valuesForHand: anEventOrHand.
	aSymbol == #action
		ifTrue: [_gsSqueakTemp_valuesForHand
				at: #priorAction
				put: (_gsSqueakTemp_valuesForHand
						at: #action
						ifAbsent: [#paint:]).
			(anObject ~~ #polygon:
					and: [self polyEditing])
				ifTrue: [self polyFreeze]].
	_gsSqueakTemp_valuesForHand at: aSymbol put: anObject.
	^ anObject