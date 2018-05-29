tests-lists
getList
	queries add: #getList.
	^(1 to: 100) collect:[:i| i printString].