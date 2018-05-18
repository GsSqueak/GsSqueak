scripting
authoringPrototype
	| aMorph aForm |
	aMorph := super authoringPrototype.
	aForm := ScriptingSystem formAtKey: 'Image'.
	aForm ifNil: [aForm := aMorph image rotateBy: 90].
	aMorph image: aForm.
	^ aMorph