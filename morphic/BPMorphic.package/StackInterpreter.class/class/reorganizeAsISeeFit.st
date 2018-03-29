miscellaneous
reorganizeAsISeeFit
	"StackInterpreter reorganizeAsISeeFit"
	"CoInterpreter reorganizeAsISeeFit"
	| _gsSqueakTemp_initializations _gsSqueakTemp_bytecodes _gsSqueakTemp_privates _gsSqueakTemp_remainder |
	_gsSqueakTemp_initializations := OrderedCollection new.
	_gsSqueakTemp_bytecodes := OrderedCollection new.
	_gsSqueakTemp_privates := OrderedCollection new.
	_gsSqueakTemp_remainder := OrderedCollection new.
	self organization categories
		do: [:cat | ((cat includesSubstring: 'initializ')
				ifTrue: [_gsSqueakTemp_initializations]
				ifFalse: [((cat endsWith: 'bytecodes')
							or: [cat includesSubstring: 'selector sends'])
						ifTrue: [_gsSqueakTemp_bytecodes]
						ifFalse: [(cat includesSubstring: 'private')
								ifTrue: [_gsSqueakTemp_privates]
								ifFalse: [_gsSqueakTemp_remainder]]])
				add: cat].
	self organization categories: _gsSqueakTemp_initializations sort , _gsSqueakTemp_bytecodes sort , _gsSqueakTemp_remainder sort , _gsSqueakTemp_privates sort