compilation
compileAccessForSlot: aSlotName 
	"Write the method to get at this inst var. "
	"Instead call the right thing to make this happen?"
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := WriteStream
				on: (String new: 2000).
	_gsSqueakTemp_s nextPutAll: aSlotName;
		 cr;
		 tab;
		 nextPutAll: '^' , aSlotName.
	self class
		compile: _gsSqueakTemp_s contents
		classified: 'public access'
		notifying: nil