utility
trimClassFoldersIn: aFileDirectory

	| classDefinitions |
	classDefinitions := self loadOverlayClassFrom: aFileDirectory.
	classDefinitions do: [:classDefinition |
		classDefinition trimMethods]