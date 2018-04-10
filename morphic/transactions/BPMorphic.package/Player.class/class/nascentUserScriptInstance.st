scripts
nascentUserScriptInstance
	"Answer a new script object of the appropriate class"
	| _gsSqueakTemp_classToUse |
	_gsSqueakTemp_classToUse := Preferences universalTiles
				ifTrue: [MethodWithInterface]
				ifFalse: [UniclassScript].
	^ _gsSqueakTemp_classToUse new