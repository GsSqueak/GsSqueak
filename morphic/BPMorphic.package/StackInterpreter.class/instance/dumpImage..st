image save/restore
dumpImage: fileName 
	"Dump the entire image out to the given file. Intended for debugging
	only. Doesn't work for Spur."
	| _gsSqueakTemp_f _gsSqueakTemp_dataSize _gsSqueakTemp_result |
	_gsSqueakTemp_f := self
				sqImageFile: (self pointerForOop: fileName)
				Open: 'wb'.
	_gsSqueakTemp_f = nil
		ifTrue: [^ -1].
	_gsSqueakTemp_dataSize := objectMemory endOfMemory - objectMemory startOfMemory.
	_gsSqueakTemp_result := self
				sq: (self pointerForOop: self memory)
				Image: (self sizeof: #'unsigned char')
				File: _gsSqueakTemp_dataSize
				Write: _gsSqueakTemp_f.
	self sqImageFileClose: _gsSqueakTemp_f.
	^ _gsSqueakTemp_result