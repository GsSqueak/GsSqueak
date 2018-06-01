-Etoys-utilities
allKnownClassVariableNames
	"Answer a set of all the knwon class variable names in the system. This
	normally retrieves them from a cache, and at present there is no
	organized mechanism for invalidating the cache. The idea is to avoid,
	in the References scheme, names that may create a conflict"
	^ ClassVarNamesInUse
		ifNil: [ClassVarNamesInUse := self allClassVarNamesInSystem
			"ClassVarNamesInUse := nil.
			Time millisecondsToRun: [ScriptingSystem
			allKnownClassVariableNames] "]