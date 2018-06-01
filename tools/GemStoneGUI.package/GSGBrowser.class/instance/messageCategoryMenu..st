message category list
messageCategoryMenu: aMenu

	^ aMenu addList: #(
			('new category...'				addMessageCategory)
			-
			('rename...'						renameMessageCategory)
			('remove (x)'					removeMessageCategory));
		yourself