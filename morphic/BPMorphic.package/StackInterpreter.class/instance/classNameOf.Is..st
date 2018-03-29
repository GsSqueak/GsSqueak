plugin primitive support
classNameOf: aClass Is: className 
	"Check if aClass's name is className"
	| _gsSqueakTemp_srcName _gsSqueakTemp_name _gsSqueakTemp_length |
	(objectMemory lengthOf: aClass)
			<= classNameIndex
		ifTrue: [^ false].
	"Not a class but might be behavior"
	_gsSqueakTemp_name := objectMemory fetchPointer: classNameIndex ofObject: aClass.
	(objectMemory isBytes: _gsSqueakTemp_name)
		ifFalse: [^ false].
	_gsSqueakTemp_length := self stSizeOf: _gsSqueakTemp_name.
	_gsSqueakTemp_srcName := self
				cCoerce: (self arrayValueOf: _gsSqueakTemp_name)
				to: 'char *'.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | (_gsSqueakTemp_srcName at: i)
					= (className at: i)
				ifFalse: [^ false]].
	"Check if className really ends at this point"
	^ (className at: _gsSqueakTemp_length)
		= 0