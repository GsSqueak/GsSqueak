message category functions
mainMessageCategoryMenu: aMenu

	^ aMenu addList: #(
			"('browse'						buildMessageCategoryBrowser)"
			"('print out'						printOutMessageCategories)"
			"('file out'						fileOutMessageCategories)"
			"-"
			"('reorganize'					editMessageCategories)"
			"('alphabetize'					alphabetizeMessageCategories)"
			"('remove empty categories'	removeEmptyCategories)"
			"('categorize all uncategorized'	categorizeAllUncategorizedMethods)"
			('new category...'				addCategory)
			-
			('rename...'						renameCategory)
			('remove (x)'					removeMessageCategory));
		yourself