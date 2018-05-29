message list
addExtraShiftedItemsTo: aMenu
	"The shifted selector-list menu is being built.  Overridden here to defeat the presence of the items that add or change order, since RecentMessageSet defines methods & order explicitly based on external criteria"

	aMenu add: 'set size of recent history...' target: RecentMessages action: #setRecentHistorySize