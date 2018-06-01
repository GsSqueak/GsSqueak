tests-trees
testTreeRoots
	self makeTree.
	queries := IdentitySet new.
	self changed: #getRoots.
	self assert: (queries includes: #getRoots).