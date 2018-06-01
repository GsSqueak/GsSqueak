menu messages
referencesToIt
	"Open a MessageSet with the references to the selected global or variable name."
	| selection environment binding |
	self selection isEmpty ifTrue: [ self selectWord ].
	environment := (model respondsTo: #selectedClassOrMetaClass)
		ifTrue: [ model selectedClassOrMetaClass ifNil: [ model environment ] ]
		ifFalse: [ model environment ].
	selection := self selectedSymbol ifNil: [ self selection asString ].
	(environment isBehavior and:
		[ (environment
			instVarIndexFor: selection
			ifAbsent: [ 0 ]) ~= 0 ]) ifTrue: [ ^ self systemNavigation
			browseAllAccessesTo: selection
			from: environment ].
	selection isSymbol ifFalse: [ ^ morph flash ].
	binding := (environment bindingOf: selection) ifNil: [ ^ morph flash ].
	self systemNavigation browseAllCallsOn: binding