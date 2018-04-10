user-defined inst vars
setNewInstVarNames: listOfStrings 
	"Make listOfStrings be the new list of instance variable names for the
	receiver "
	| _gsSqueakTemp_disappearing _gsSqueakTemp_firstAppearing _gsSqueakTemp_instVarString _gsSqueakTemp_instVarList |
	_gsSqueakTemp_instVarList := self instVarNames asOrderedCollection.
	_gsSqueakTemp_disappearing := _gsSqueakTemp_instVarList copy.
	_gsSqueakTemp_disappearing removeAllFoundIn: listOfStrings.
	_gsSqueakTemp_disappearing
		do: [:oldName | self removeAccessorsFor: oldName].
	_gsSqueakTemp_firstAppearing := listOfStrings copy.
	_gsSqueakTemp_firstAppearing removeAllFoundIn: _gsSqueakTemp_instVarList.
	_gsSqueakTemp_instVarString := String
				streamContents: [:aStream | listOfStrings
						do: [:aString | aStream nextPutAll: aString;
								 nextPut: Character space]].
	superclass
		subclass: self name
		instanceVariableNames: _gsSqueakTemp_instVarString
		classVariableNames: ''
		poolDictionaries: ''
		category: self categoryForUniclasses.
	_gsSqueakTemp_firstAppearing
		do: [:newName | self compileAccessorsFor: newName]