system control primitives
primitiveVMPath
	"Return a string containing the path name of VM's directory."
	| _gsSqueakTemp_s _gsSqueakTemp_sz |
	_gsSqueakTemp_sz := self vmPathSize.
	_gsSqueakTemp_s := objectMemory
				instantiateClass: (objectMemory splObj: ClassByteString)
				indexableSize: _gsSqueakTemp_sz.
	self vmPathGet: _gsSqueakTemp_s + objectMemory baseHeaderSize Length: _gsSqueakTemp_sz.
	self pop: 1 thenPush: _gsSqueakTemp_s