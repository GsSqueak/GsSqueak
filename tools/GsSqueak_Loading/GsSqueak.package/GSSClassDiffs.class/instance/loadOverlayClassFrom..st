loading
loadOverlayClassFrom: aFileDirectory

	| classDefinition |
	classDefinition := GSSClassDefinition loadFrom: aFileDirectory.
	self classDefinitions at: classDefinition name ifPresentPut: classDefinition.