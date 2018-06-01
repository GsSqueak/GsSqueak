loading
loadClassDefinitions

	self loadConfiguration.
	self originalClasses do: [:classDefinition |
		self classDefinitions at: classDefinition name put: classDefinition].
	self overlayClasses do: [:classDefinition |
		self classDefinitions at: classDefinition name put: classDefinition].
	