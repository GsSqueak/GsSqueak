-Etoys
traverseRowTranslateSlotOld: oldSlotName to: newSlotName 
	"Traverse my submorphs, translating submorphs appropriately given
	the slot rename"
	submorphs
		do: [:tile | 
			(tile isKindOf: AssignmentTileMorph)
				ifTrue: [tile assignmentRoot = oldSlotName
						ifTrue: [tile setRoot: newSlotName]].
			(tile isMemberOf: TileMorph)
				ifTrue: [tile operatorOrExpression = oldSlotName asGetterSelector
						ifTrue: [tile setOperator: newSlotName asGetterSelector]].
			tile traverseRowTranslateSlotOld: oldSlotName to: newSlotName]