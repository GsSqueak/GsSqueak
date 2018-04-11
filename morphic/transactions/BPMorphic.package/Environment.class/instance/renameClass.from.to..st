classes and traits
renameClass: aClass from: oldName to: newName 
	"Rename the class, aClass, to have the title newName."
	| _gsSqueakTemp_oldBinding _gsSqueakTemp_newBinding _gsSqueakTemp_category |
	_gsSqueakTemp_category := self organization categoryOfElement: oldName.
	self organization
		classify: newName
		under: _gsSqueakTemp_category
		suppressIfDefault: true.
	self organization removeElement: oldName.
	_gsSqueakTemp_oldBinding := self declarationOf: oldName.
	declarations removeKey: oldName.
	self binding: _gsSqueakTemp_oldBinding removedFrom: self.
	"re-route now undeclared oldBinding"
	_gsSqueakTemp_oldBinding value: aClass.
	_gsSqueakTemp_newBinding := newName => aClass.
	aClass updateMethodBindingsTo: _gsSqueakTemp_newBinding.
	declarations add: _gsSqueakTemp_newBinding.
	self binding: _gsSqueakTemp_newBinding addedTo: self.
	Smalltalk
		renamedClass: aClass
		from: oldName
		to: newName.
	SystemChangeNotifier uniqueInstance
		classRenamed: aClass
		from: oldName
		to: newName
		inCategory: _gsSqueakTemp_category