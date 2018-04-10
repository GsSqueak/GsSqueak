user-scripted subclasses
tileScriptNames
	scripts
		ifNil: [^ OrderedCollection new].
	"The following is an emergency workaround for damaged script
	dictionaries occurring in Alan's demo image 8/2/98; no selector should
	be nil but somehow some is, so here we filter such damaging things
	out "
	^ scripts
		collect: [:aScript | aScript selector]
		thenSelect: [:n | n ~~ nil]