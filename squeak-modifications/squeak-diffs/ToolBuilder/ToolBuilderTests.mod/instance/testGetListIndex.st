tests-lists
testGetListIndex
	self makeList.
	queries := IdentitySet new.
	self changed: #getListIndex.
	self assert: (queries includes: #getListIndex).