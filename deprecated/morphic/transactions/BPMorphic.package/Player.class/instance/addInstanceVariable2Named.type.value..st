slots-user
addInstanceVariable2Named: nameSymbol type: typeChosen value: aValue 
	"Add an instance variable of the given name and type, and initialize it
	to have the given value"
	| _gsSqueakTemp_initialValue _gsSqueakTemp_setterSelector |
	self assureUniClass.
	self slotInfo
		at: nameSymbol
		put: (SlotInformation new initialize type: typeChosen).
	_gsSqueakTemp_initialValue := aValue.
	self addInstanceVarNamed: nameSymbol withValue: aValue.
	self class compileAccessorsFor: nameSymbol.
	_gsSqueakTemp_setterSelector := nameSymbol asSetterSelector.
	(self class allSubInstances copyWithout: self)
		do: [:anInstance | anInstance perform: _gsSqueakTemp_setterSelector with: _gsSqueakTemp_initialValue].
	self updateAllViewersAndForceToShow: #'instance variables'