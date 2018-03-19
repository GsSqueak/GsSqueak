copying
copyUniClassWith: deepCopier 
	"my class is a subclass of Player. Return another class just like my
	class. Share the costume list."
	| _gsSqueakTemp_newCls |
	_gsSqueakTemp_newCls := self class officialClass newUniqueClassInstVars: self class instanceVariablesString classInstVars: self class class instanceVariablesString.
	_gsSqueakTemp_newCls copyMethodDictionaryFrom: self class.
	_gsSqueakTemp_newCls class copyMethodDictionaryFrom: self class class.
	_gsSqueakTemp_newCls scripts: self class privateScripts.
	"duplicate this in mapUniClasses"
	_gsSqueakTemp_newCls
		slotInfo: (self class privateSlotInfo veryDeepCopyWith: deepCopier).
	_gsSqueakTemp_newCls copyAddedStateFrom: self class.
	"All class inst vars for inter Player refs"
	^ _gsSqueakTemp_newCls