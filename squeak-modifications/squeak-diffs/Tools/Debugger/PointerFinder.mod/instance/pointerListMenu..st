pointer-list
pointerListMenu: aMenu

	<pointerListMenu>	
	^ aMenu
		addList: #(
			('Inspect (i)' #inspectObject 'Live long and prosper!')
			-
			('Search again' #searchAgain 'Search again\for the same object' withCRs));
		yourself.