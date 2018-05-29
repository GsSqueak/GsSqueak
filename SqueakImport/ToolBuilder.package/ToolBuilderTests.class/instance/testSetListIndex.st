tests-lists
testSetListIndex
	self makeList.
	queries := IdentitySet new.
	self changeListWidget.
	self assert: (queries includes: #setListIndex).