contents
newClassContents

	| superclass |
	superclass := self selectedClassName ifNil: [#Object].
	^ self topazProxy 
			templateForSubclassOf: superclass
			category: self selectedSystemCategory