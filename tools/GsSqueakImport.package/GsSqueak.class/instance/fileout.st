utility
fileout

	self classDefinitions do: [:classDefinition |
		classDefinition fileoutTo: self fileDirectory]