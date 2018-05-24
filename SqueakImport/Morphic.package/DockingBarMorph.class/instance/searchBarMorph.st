events-processing
searchBarMorph

	^self submorphs detect: [ :each | each knownName = #searchBar ] ifNone: [ nil ]