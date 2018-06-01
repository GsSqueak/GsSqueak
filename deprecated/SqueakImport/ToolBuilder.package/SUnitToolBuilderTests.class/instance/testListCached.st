tests
testListCached
	
	self makeItemList.
	queries := Bag new.
	self changed: #getList.
	widget list.
	widget list.
	self assert: queries size = 1