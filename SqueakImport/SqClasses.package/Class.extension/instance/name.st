*SqClasses-accessing
name
	"Answer the name of the receiver."
	self == ByteString ifTrue: [^ #'ByteString'].
	self == Metaclass ifTrue: [^ #'Metaclass'].
	self == ByteSymbol ifTrue: [^ #'ByteSymbol'].
	self == GsMethodDictionary ifTrue: [^ #'MethodDictionary'].
	name == nil
		ifTrue: [^super name]
		ifFalse: [^name]
