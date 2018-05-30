tests-lists
testGetListSelection
	self makeItemList.
	queries := IdentitySet new.
	self changed: #getListSelection.
	self assert: (queries includes: #getListSelection).