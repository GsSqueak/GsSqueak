what to show
toggleShowingByteCodes
	"Toggle whether the receiver is showing bytecodes"

	self restoreTextualCodingPane.
	self showByteCodes: self showingByteCodes not.
	self setContentsToForceRefetch.
	self contentsChanged