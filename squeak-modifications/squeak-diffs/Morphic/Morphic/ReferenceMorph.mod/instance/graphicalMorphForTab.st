menu
graphicalMorphForTab
	| formToUse |
	formToUse := self valueOfProperty: #priorGraphic ifAbsent: [ScriptingSystem formAtKey: 'squeakyMouse'].
	^ SketchMorph withForm: formToUse