tests-trees
testTreeGetSelectionPath
	self makeTree.
	queries := IdentitySet new.
	self changed: #getTreeSelectionPath.
	self waitTick.
	self assert: (queries includes: #getTreeSelectionPath).
	self assert: (queries includes: #getChildrenOf).
	self assert: (queries includes: #setTreeSelection).
