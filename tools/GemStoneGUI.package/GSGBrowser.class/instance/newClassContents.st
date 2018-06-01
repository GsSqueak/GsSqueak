contents
newClassContents

	| superclass |
	superclass := self selectedClassName ifNil: [#Object].
	^ self environment
		templateForSubclassOf: superclass
		category: self selectedSystemCategory