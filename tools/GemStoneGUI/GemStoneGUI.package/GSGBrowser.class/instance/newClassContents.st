contents
newClassContents

	| superclass |
	superclass := self selectedClassName ifNil: [#Object].
	^ self interface 
			templateForSubclassOf: superclass
			category: self selectedSystemCategory