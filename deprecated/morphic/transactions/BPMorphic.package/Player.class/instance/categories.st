slots-kernel
categories
	"Answer a list of categories appropriate to the the receiver and its
	costumes "
	| _gsSqueakTemp_aList |
	self hasCostumeThatIsAWorld
		ifTrue: [^ self categoriesForWorld].
	_gsSqueakTemp_aList := OrderedCollection new.
	self slotNames notEmpty
		ifTrue: [_gsSqueakTemp_aList add: ScriptingSystem nameForInstanceVariablesCategory].
	_gsSqueakTemp_aList addAll: costume categoriesForViewer.
	_gsSqueakTemp_aList
		remove: ScriptingSystem nameForScriptsCategory
		ifAbsent: [].
	_gsSqueakTemp_aList add: ScriptingSystem nameForScriptsCategory after: _gsSqueakTemp_aList first.
	^ _gsSqueakTemp_aList