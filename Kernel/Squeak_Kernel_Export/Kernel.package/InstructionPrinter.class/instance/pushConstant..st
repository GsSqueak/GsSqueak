instruction decoding
pushConstant: obj
	"Print the Push Constant, obj, on Top Of Stack bytecode."

	self print: (String streamContents:
				[:s |
				s nextPutAll: 'pushConstant: '.
				obj isVariableBinding
					ifTrue:
						[obj key
							ifNotNil: [s nextPutAll: '##'; nextPutAll: obj key]
							ifNil: [s nextPutAll: '###'; nextPutAll: obj value soleInstance name]]
					ifFalse:
						[obj isClosure
							ifTrue: [s nextPutAll: obj sourceString]
							ifFalse: [obj printOn: s]]]).

	obj isCompiledMethod ifTrue:
		[obj longPrintOn: stream indent: self indent + 2.
		^self]