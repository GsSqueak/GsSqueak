turtles
createSequencialStubSubclass
	| _gsSqueakTemp_instVarString _gsSqueakTemp_classInstVarString _gsSqueakTemp_aName _gsSqueakTemp_aClass |
	_gsSqueakTemp_instVarString := KedamaSequenceExecutionStub instVarNames.
	_gsSqueakTemp_classInstVarString := ''.
	_gsSqueakTemp_aName := self chooseUniqueTurtleClassName.
	_gsSqueakTemp_aClass := self
				subclass: _gsSqueakTemp_aName
				instanceVariableNames: _gsSqueakTemp_instVarString
				classVariableNames: ''
				poolDictionaries: ''
				category: self categoryForUniclasses.
	_gsSqueakTemp_classInstVarString size > 0
		ifTrue: [_gsSqueakTemp_aClass class instanceVariableNames: _gsSqueakTemp_classInstVarString].
	_gsSqueakTemp_aClass copyAllCategoriesUnobtrusivelyFrom: KedamaSequenceExecutionStub.
	^ _gsSqueakTemp_aClass