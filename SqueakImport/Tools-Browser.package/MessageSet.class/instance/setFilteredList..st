private
setFilteredList: newList 
	"Establish newList as the new list if appropriate, and adjust the window title accordingly; if the new list is of the same size as the old, warn and do nothing"
	newList size = 0 ifTrue:
		[ self inform: 'Nothing would be left in the list if you did that'.
		^false ].
	newList size = messageList size ifTrue:
		[ self inform: 'That leaves the list unchanged'.
		^false ].
	self
		 initializeMessageList: newList ;
		 adjustWindowTitleAfterFiltering.
	^true