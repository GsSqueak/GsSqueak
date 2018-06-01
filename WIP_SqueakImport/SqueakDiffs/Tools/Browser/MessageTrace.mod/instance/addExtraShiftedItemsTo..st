message list
addExtraShiftedItemsTo: aMenu 
	"The shifted selector-list menu is being built.  Add items specific to MessageTrace."
	super addExtraShiftedItemsTo: aMenu.
	aMenu addList: #(#('invert level selection (I)' #invertLevelSelection) )