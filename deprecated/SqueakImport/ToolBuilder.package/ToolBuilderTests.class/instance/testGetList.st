tests-lists
testGetList
	self makeList.
	queries := IdentitySet new.
	self changed: #getList.
	self assert: (queries includes: #getList).