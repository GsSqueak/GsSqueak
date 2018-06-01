scripts
namedTileScriptSelectors
	"Answer a list of all the selectors of named tile scripts"
	scripts
		ifNil: [^ OrderedCollection new].
	^ scripts
		select: [:aScript | aScript selector ~~ nil]
		thenCollect: [:aScript | aScript selector]