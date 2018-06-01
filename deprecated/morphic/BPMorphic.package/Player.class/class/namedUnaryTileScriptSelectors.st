scripts
namedUnaryTileScriptSelectors
	"Answer a list of all the selectors of named unary tile scripts"
	scripts
		ifNil: [^ OrderedCollection new].
	^ scripts
		select: [:aScript | | sel | (sel := aScript selector) notNil
				and: [sel numArgs = 0]]
		thenCollect: [:aScript | aScript selector]