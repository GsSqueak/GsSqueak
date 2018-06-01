tests
testListSelectionCached
	
	self makeItemList.
	queries := Bag new.
	self changed: #getListSelection.
	widget selectedIndex.
	widget selectedIndex.
	self assert: queries size = 1