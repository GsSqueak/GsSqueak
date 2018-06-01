scripts-kernel
addIdiosyncraticMenuItemsTo: aMenu forSlotSymol: slotSym 
	"The menu provided has the receiver as its argument, and is used as
	the menu for the given slot-symbol in a line of a Viewer. Add
	special-case items"
	(#(#copy #getNewClone #newClone ) includes: slotSym)
		ifTrue: [aMenu add: 'give me a copy now' translated action: #handTheUserACopy]