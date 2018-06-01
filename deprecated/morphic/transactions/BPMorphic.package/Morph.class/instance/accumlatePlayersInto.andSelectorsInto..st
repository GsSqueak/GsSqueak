-Etoys
accumlatePlayersInto: aCollection andSelectorsInto: selectorsCollection 
	submorphs
		do: [:tile | 
			(tile isMemberOf: TileMorph)
				ifTrue: [(tile type = #objRef
							and: [tile actualObject isKindOf: Player])
						ifTrue: [aCollection add: tile actualObject]].
			(tile isKindOf: AssignmentTileMorph)
				ifTrue: [tile type = #operator
						ifTrue: [selectorsCollection add: tile operatorOrExpression]].
			tile accumlatePlayersInto: aCollection andSelectorsInto: selectorsCollection]