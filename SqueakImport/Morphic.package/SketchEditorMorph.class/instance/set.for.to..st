Nebraska support
set: aSymbol for: anEventOrHand to: anObject

	| valuesForHand |

	valuesForHand := self valuesForHand: anEventOrHand.
	aSymbol == #action ifTrue: [
		valuesForHand at: #priorAction put: (valuesForHand at: #action ifAbsent: [#paint:]).
		(anObject ~~ #polygon: and:[self polyEditing]) ifTrue:[self polyFreeze].
	].
	valuesForHand at: aSymbol put: anObject.
	^anObject

