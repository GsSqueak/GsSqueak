tests-lists
testSetListSelection
	self makeItemList.
	queries := IdentitySet new.
	self changeListWidget.
	self assert: (queries includes: #setListSelection).