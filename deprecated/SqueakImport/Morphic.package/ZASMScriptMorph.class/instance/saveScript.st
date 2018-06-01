as yet unclassified
saveScript

	| newScript scriptName |
	newScript := self compileScript.
	scriptName := UIManager default 
		request: 'Name this script' 
		initialAnswer: (self valueOfProperty: #cameraScriptName ifAbsent: ['']).
	scriptName isEmptyOrNil ifTrue: [^self].
	(self valueOfProperty: #cameraController)
		saveScript: newScript
		as: scriptName.
	self delete.