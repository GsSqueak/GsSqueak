menu
graphicalMorphForTab
	| _gsSqueakTemp_formToUse |
	_gsSqueakTemp_formToUse := self
				valueOfProperty: #priorGraphic
				ifAbsent: [ScriptingSystem formAtKey: 'squeakyMouse'].
	^ SketchMorph withForm: _gsSqueakTemp_formToUse