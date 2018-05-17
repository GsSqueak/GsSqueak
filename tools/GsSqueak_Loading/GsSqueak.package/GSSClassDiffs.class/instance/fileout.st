utility
fileout

	| toBeFileouted |
	toBeFileouted := self classDefinitions reject: [:classDefinition | classDefinition shouldNotFileout].
	toBeFileouted do: [:classDefinition |
		classDefinition fileout]