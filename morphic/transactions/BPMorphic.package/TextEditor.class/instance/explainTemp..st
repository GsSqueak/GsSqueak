explain
explainTemp: string 
	"Is string the name of a temporary variable (method or block
	argument or temporary)?"
	| _gsSqueakTemp_selectedClass _gsSqueakTemp_methodNode _gsSqueakTemp_tempNode |
	(model respondsTo: #selectedMessageName)
		ifFalse: [^ nil].
	model selectedMessageName
		ifNil: [^ nil].
	"not in a method"
	_gsSqueakTemp_selectedClass := model selectedClassOrMetaClass.
	_gsSqueakTemp_methodNode := _gsSqueakTemp_selectedClass newParser parse: model selectedMessage class: _gsSqueakTemp_selectedClass.
	_gsSqueakTemp_tempNode := _gsSqueakTemp_methodNode encoder tempNodes
				detect: [:n | n name = string]
				ifNone: [^ nil].
	^ (_gsSqueakTemp_tempNode isArg
		ifTrue: ['"is an argument to this ']
		ifFalse: ['"is a temporary variable in this '])
		, (_gsSqueakTemp_tempNode isDeclaredAtMethodLevel
				ifTrue: ['method"']
				ifFalse: ['block"'])