slots-user
addInstanceVariable
	"Offer the user the opportunity to add an instance variable, and if he
	goes through with it, actually add it."
	| _gsSqueakTemp_itsName _gsSqueakTemp_initialValue _gsSqueakTemp_typeChosen _gsSqueakTemp_usedNames _gsSqueakTemp_initialAnswer _gsSqueakTemp_setterSelector _gsSqueakTemp_originalString |
	_gsSqueakTemp_usedNames := self class instVarNames.
	_gsSqueakTemp_initialAnswer := Utilities
				keyLike: 'var' translated , (_gsSqueakTemp_usedNames size + 1) asString
				satisfying: [:aKey | (_gsSqueakTemp_usedNames includes: aKey) not].
	_gsSqueakTemp_originalString := UIManager default request: 'name for new variable: ' translated initialAnswer: _gsSqueakTemp_initialAnswer.
	_gsSqueakTemp_originalString isEmptyOrNil
		ifTrue: [^ self].
	_gsSqueakTemp_itsName := ScriptingSystem
				acceptableSlotNameFrom: _gsSqueakTemp_originalString
				forSlotCurrentlyNamed: nil
				asSlotNameIn: self
				world: self costume world.
	_gsSqueakTemp_itsName size = 0
		ifTrue: [^ self].
	self assureUniClass.
	_gsSqueakTemp_typeChosen := self initialTypeForSlotNamed: _gsSqueakTemp_itsName.
	self slotInfo
		at: _gsSqueakTemp_itsName
		put: (SlotInformation new initialize type: _gsSqueakTemp_typeChosen).
	_gsSqueakTemp_initialValue := self initialValueForSlotOfType: _gsSqueakTemp_typeChosen.
	self addInstanceVarNamed: _gsSqueakTemp_itsName withValue: _gsSqueakTemp_initialValue.
	self compileInstVarAccessorsFor: _gsSqueakTemp_itsName.
	_gsSqueakTemp_setterSelector := _gsSqueakTemp_itsName asSetterSelector.
	((self class allSubInstances copyWithout: self)
		reject: [:e | e isSequentialStub])
		do: [:anInstance | anInstance perform: _gsSqueakTemp_setterSelector with: _gsSqueakTemp_initialValue].
	self updateAllViewersAndForceToShow: ScriptingSystem nameForInstanceVariablesCategory