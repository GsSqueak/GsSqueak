menu messages
wordSelectAndEmptyCheck: returnBlock
	"Ensure selecting the entire current word; if after that's done the selection is still empty, then evaluate the returnBlock, which will typically consist of '[^ self]' in the caller -- check senders of this method to understand this."

	self selectWord.  "Select exactly a whole word"
	self hasSelection ifFalse: [morph flash.  ^ returnBlock value]