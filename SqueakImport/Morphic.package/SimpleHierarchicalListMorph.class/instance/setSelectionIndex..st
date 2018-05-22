keyboard navigation
setSelectionIndex: idx
	"Called internally to select the index-th item."
	| theMorph index max currentIndex |
	idx ifNil: [^ self].
	max := scroller submorphs size.
	currentIndex := self getSelectionIndex.
	
	index := idx min: max max: 0.
	theMorph := index = 0 ifTrue: [nil] ifFalse: [scroller submorphs at: index].

	"Skip invisible rows."
	[theMorph notNil and: [theMorph visible not]] whileTrue: [
		currentIndex < index
			ifTrue: [index := index + 1]
			ifFalse: [index := index - 1].		
		(index < 1 or: [index > max]) ifTrue: [^ self].
		theMorph := scroller submorphs at: index.
	].
	self setSelectedMorph: theMorph.