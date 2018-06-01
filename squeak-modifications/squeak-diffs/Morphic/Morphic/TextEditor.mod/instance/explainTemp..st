explain
explainTemp: string 
	"Is string the name of a temporary variable (method or block argument or temporary)?"

	| selectedClass methodNode tempNode |
	(model respondsTo: #selectedMessageName) ifFalse: [^ nil].
	model selectedMessageName ifNil: [^nil].	"not in a method"
	selectedClass := model selectedClassOrMetaClass.
	methodNode := selectedClass newParser parse: model selectedMessage class: selectedClass.
	tempNode := methodNode encoder tempNodes detect: [:n| n name = string] ifNone: [^nil].
	^(tempNode isArg
		ifTrue: ['"is an argument to this ']
		ifFalse: ['"is a temporary variable in this ']),
	   (tempNode isDeclaredAtMethodLevel
		ifTrue: ['method"']
		ifFalse: ['block"'])