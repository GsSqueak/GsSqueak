loading
importTo: gemstoneEnvironment

	| sortedClasses |
	sortedClasses := self sortedClassDefinitions.
	sortedClasses do: [:classDef | 
		self createClass: classDef in: gemstoneEnvironment.].