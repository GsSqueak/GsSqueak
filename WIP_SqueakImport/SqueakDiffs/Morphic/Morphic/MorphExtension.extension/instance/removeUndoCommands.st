*Morphic-MorphicExtras-Undo
removeUndoCommands

	| keysToBeRemoved |
	otherProperties ifNil: [ ^self ].
	otherProperties keysAndValuesDo: [ :key :value |
		value class == Command ifTrue: [
			(keysToBeRemoved ifNil: [
				keysToBeRemoved := OrderedCollection new ]) add: key ] ].
	keysToBeRemoved ifNil: [ ^self ].
	keysToBeRemoved do: [ :each |
		self removeProperty: each ]
	