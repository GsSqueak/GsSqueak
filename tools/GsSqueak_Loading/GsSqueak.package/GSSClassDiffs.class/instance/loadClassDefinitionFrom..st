reading
loadClassDefinitionFrom: aFileDirectory

	| classDefinition |
	classDefinition := GSSClassDefinition loadFrom: aFileDirectory.
	self classDefinitions at: classDefinition name put: classDefinition.