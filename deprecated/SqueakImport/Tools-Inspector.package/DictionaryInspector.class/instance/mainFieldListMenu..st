menu
mainFieldListMenu: aMenu

	^ aMenu addList: #(	
		('inspect'							inspectSelection)
		('inspect key'						inspectKey)
		('copy name'						copyName)
		('references'						selectionReferences)
		('objects pointing to this value'		objectReferencesToSelection)
		('senders of this key'				sendersOfSelectedKey)
		-
		('refresh view'						refreshView)
		('add key'							addEntry)
		('rename key'						renameEntry)
		-
		('remove'							removeSelection)
		('basic inspect'					inspectBasic));
	yourself
