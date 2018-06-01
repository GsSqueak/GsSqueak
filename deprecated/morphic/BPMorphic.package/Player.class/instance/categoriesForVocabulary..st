slots-kernel
categoriesForVocabulary: aVocabulary 
	"Answer a list of categories appropriate to the receiver and its
	costumes, in the given Vocabulary"
	| _gsSqueakTemp_aList |
	self hasCostumeThatIsAWorld
		ifTrue: [_gsSqueakTemp_aList := self categoriesForWorld]
		ifFalse: [_gsSqueakTemp_aList := OrderedCollection new.
			self slotNames
				ifNotEmpty: [_gsSqueakTemp_aList add: ScriptingSystem nameForInstanceVariablesCategory].
			_gsSqueakTemp_aList addAll: costume categoriesForViewer].
	aVocabulary addCustomCategoriesTo: _gsSqueakTemp_aList.
	_gsSqueakTemp_aList
		remove: ScriptingSystem nameForScriptsCategory
		ifAbsent: [].
	_gsSqueakTemp_aList add: ScriptingSystem nameForScriptsCategory after: _gsSqueakTemp_aList first.
	^ _gsSqueakTemp_aList