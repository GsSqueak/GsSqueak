meta-actions
invokeMetaMenu: evt

	| menu |
	menu := self buildMetaMenu: evt.
	menu addTitle: self externalName.
	menu popUpEvent: evt in: self world