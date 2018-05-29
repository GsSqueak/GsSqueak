system category functions
mainSystemCategoryMenu: aMenu
	<systemCategoryMenu>
	^ aMenu addList: #(
			('find class... (f)'			findClass)
			('back... (b)'				recent)
			-
			('browse all'			browseAllClasses)
			('browse'				buildSystemCategoryBrowser)
			-
			('printOut'				printOutSystemCategory)
			('fileOut'				fileOutSystemCategory)
			-
			('reorganize'			editSystemCategories)
			('alphabetize'			alphabetizeSystemCategories)
			-
			('update'				updateSystemCategories)
			('add item...'				addSystemCategory)
			('rename...'				renameSystemCategory)
			('remove (x)'			removeSystemCategory));
		yourself
