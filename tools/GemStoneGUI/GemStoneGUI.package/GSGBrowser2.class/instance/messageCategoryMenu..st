message category list
messageCategoryMenu: aMenu

	^ aMenu addList: #(
			('new category...'				addCategory)
			-
			('rename...'						renameCategory)
			('remove (x)'					removeMessageCategory));
		yourself