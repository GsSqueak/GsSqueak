building
removeMessageFromBrowser
	| indexToSelect |
	"Try to keep the same selection index."
	indexToSelect := (messageSelections indexOf: true) max: 1.
	self selectedMessages do: [ :eachMethodReference | self deleteFromMessageList: eachMethodReference ].
	self deselectAll.
	messageSelections ifNotEmpty:
		[ messageSelections 
			at: (indexToSelect min: messageSelections size)  "safety"
			put: true ].
	anchorIndex := indexToSelect min: messageSelections size.
	self 
		messageListIndex: anchorIndex ; 
		reformulateList