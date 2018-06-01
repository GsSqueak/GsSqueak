accessing
suggestCategoryToSpawnedBrowser: aBrowser
	"aBrowser is a message-category browser being spawned from the receiver.  Tell it what it needs to know to get its category info properly set up."

	(self isMemberOf: Browser) "yecch, but I didn't invent the browser hierarchy"
		ifTrue:
			[aBrowser messageCategoryListIndex: (self messageCategoryList indexOf: self categoryOfCurrentMethod ifAbsent: [2])]
		ifFalse:
			[aBrowser setOriginalCategoryIndexForCurrentMethod]