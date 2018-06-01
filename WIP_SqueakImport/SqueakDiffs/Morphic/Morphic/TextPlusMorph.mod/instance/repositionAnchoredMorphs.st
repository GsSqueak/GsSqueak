as yet unclassified
repositionAnchoredMorphs

	| firstCharacterIndex lastCharacterIndex |

	firstCharacterIndex := self paragraph firstCharacterIndex.
	lastCharacterIndex := paragraph lastCharacterIndex.
	text runs withStartStopAndValueDo: [:start :stop :attributes |
		attributes do: [:att | | leftShift am cBlock |
			(att isMemberOf: TextAnchor) ifTrue: [
				am := att anchoredMorph.
				(am isNil or: [am world isNil]) ifFalse: [
					(stop between: firstCharacterIndex and: lastCharacterIndex) ifTrue: [
						cBlock := self paragraph characterBlockForIndex: stop.
						leftShift := am valueOfProperty: #geeMailLeftOffset ifAbsent: [0].
						am position: (self left + leftShift) @ cBlock origin y.
					].
				]
			]
		]
	].
