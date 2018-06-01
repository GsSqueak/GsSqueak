tests-trees
testTreeExpandPathFirst
	"@@@@: REMOVE THIS - it's a hack (changed: #openPath)"
	self makeTree.
	queries := IdentitySet new.
	self changed: {#openPath. '1'. '2'. '2'}.
	self waitTick.
	self assert: (queries includes: #getChildrenOf).
	self assert: (queries includes: #setTreeSelection).
	self assert: (queries includes: #getLabelOf).
