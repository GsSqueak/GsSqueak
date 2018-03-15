menu messages
referencesToIt
	"Open a MessageSet with the references to the selected global or
	variable name."
	| _gsSqueakTemp_selection _gsSqueakTemp_environment _gsSqueakTemp_binding |
	self selection isEmpty
		ifTrue: [self selectWord].
	_gsSqueakTemp_environment := (model respondsTo: #selectedClassOrMetaClass)
				ifTrue: [model selectedClassOrMetaClass
						ifNil: [model environment]]
				ifFalse: [model environment].
	_gsSqueakTemp_selection := self selectedSymbol
				ifNil: [self selection asString].
	(_gsSqueakTemp_environment isBehavior
			and: [(_gsSqueakTemp_environment
					instVarIndexFor: _gsSqueakTemp_selection
					ifAbsent: [0])
					~= 0])
		ifTrue: [^ self systemNavigation browseAllAccessesTo: _gsSqueakTemp_selection from: _gsSqueakTemp_environment].
	_gsSqueakTemp_selection isSymbol
		ifFalse: [^ morph flash].
	_gsSqueakTemp_binding := (_gsSqueakTemp_environment bindingOf: _gsSqueakTemp_selection)
				ifNil: [^ morph flash].
	self systemNavigation browseAllCallsOn: _gsSqueakTemp_binding