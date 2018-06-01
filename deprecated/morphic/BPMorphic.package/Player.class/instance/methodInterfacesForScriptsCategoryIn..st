scripting
methodInterfacesForScriptsCategoryIn: aVocabulary 
	"Answer a list of method interfaces for the category #scripts, as seen
	in a viewer or other tool. The vocabulary argument is not presently
	used. "
	| _gsSqueakTemp_myScripts |
	_gsSqueakTemp_myScripts := self class scripts values
				collect: [:us | (us isKindOf: UserScript)
						ifTrue: [us as: MethodWithInterface]
						ifFalse: [us]].
	^ {self methodInterfaceForEmptyScript} , _gsSqueakTemp_myScripts