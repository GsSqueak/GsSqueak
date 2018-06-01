menu
mainFieldListMenu: aMenu

	^ aMenu addTranslatedList: #(
			('inspect'							inspectSelection)
			('copy name'						copyName)
			('objects pointing to this value'		objectReferencesToSelection)
			('refresh view'						update)
			('remove'							removeSelection)
			-
			('basic inspect'						inspectBasic));
		yourself
