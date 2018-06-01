selector list
mainSelectorListMenu: aMenu
	"Answer the menu associated with the selectorList"
	<selectorListMenu>
	aMenu addList: #(
		('senders (n)'				browseSenders		'browse senders of the chosen selector')
		('copy selector to clipboard'	copyName			'copy the chosen selector to the clipboard, for subsequent pasting elsewhere')
		-
		('show only implemented selectors'	showOnlyImplementedSelectors		'remove from the selector-list all symbols that do not represent implemented methods')).

	^ aMenu