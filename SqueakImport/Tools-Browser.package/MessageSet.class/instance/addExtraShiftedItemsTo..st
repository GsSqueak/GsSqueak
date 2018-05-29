message list
addExtraShiftedItemsTo: aMenu
	"The shifted selector-list menu is being built.  Add items specific to MessageSet"
	self growable ifTrue:
		[aMenu addList: #(
			-
			('remove from this browser (d)'		removeMessageFromBrowser)
			('filter message list...'			filterMessageList))].
	aMenu 
		add: 'sort by date'
		action: #sortByDate