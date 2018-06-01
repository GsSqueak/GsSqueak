compilation
compileAccessForSlot: aSlotName
	"Write the method to get at this inst var.  "
	"Instead call the right thing to make this happen?"

	| s  |
	s := WriteStream on: (String new: 2000).
	s nextPutAll: aSlotName; cr; tab; nextPutAll: '^', aSlotName.
	self class
		compile: s contents
		classified: 'public access'
		notifying: nil.
