tests
testTextCached
	
	self makeText.
	queries := Bag new.
	self changed: #getText.
	widget text.
	widget text.
	self assert: queries size = 1