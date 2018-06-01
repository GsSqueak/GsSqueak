private
selection
	"Answer the item in the list that is currently selected, or nil if no selection is present"

	^ self messageList at: (self messageListIndex) ifAbsent: [nil]