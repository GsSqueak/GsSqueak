accessing
name
	"Answer the name of the receiver."
	self == ByteString ifTrue: [^ #'ByteString'].
	self == Metaclass ifTrue: [^ #'Metaclass'].
	self == ByteSymbol ifTrue: [^ #'ByteSymbol'].
	self == MethodDictionary ifTrue: [^ #'MethodDictionary'].
	self == CompiledMethod ifTrue: [^ #'CompiledMethod'].
	self == Mutex ifTrue: [ ^ #'Mutex'].
	self == Semaphore ifTrue: [^ #'Semaphore'].
	self == Exception ifTrue: [^ #'Exception'].
	self == BlockClosure ifTrue: [^ #'BlockClosure'].
	self == Process ifTrue: [^ #'Process'].
	name == nil
		ifTrue: [^super name]
		ifFalse: [^name]
