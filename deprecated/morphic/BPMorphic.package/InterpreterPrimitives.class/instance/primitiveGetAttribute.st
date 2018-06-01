system control primitives
primitiveGetAttribute
	"Fetch the system attribute with the given integer ID. The 
	result is a string, which will be empty if the attribute is not 
	defined."
	| _gsSqueakTemp_attr _gsSqueakTemp_sz _gsSqueakTemp_s |
	_gsSqueakTemp_attr := self stackIntegerValue: 0.
	self successful
		ifTrue: [_gsSqueakTemp_sz := self attributeSize: _gsSqueakTemp_attr].
	self successful
		ifTrue: [_gsSqueakTemp_s := objectMemory
						instantiateClass: (objectMemory splObj: ClassByteString)
						indexableSize: _gsSqueakTemp_sz.
			self
				getAttribute: _gsSqueakTemp_attr
				Into: _gsSqueakTemp_s + objectMemory baseHeaderSize
				Length: _gsSqueakTemp_sz.
			self pop: 2 thenPush: _gsSqueakTemp_s]