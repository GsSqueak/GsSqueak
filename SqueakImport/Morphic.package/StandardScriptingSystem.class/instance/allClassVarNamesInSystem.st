utilities
allClassVarNamesInSystem
	"Compute and answer a set of all the class variable names known to the sytem from any class"

	| aList |
	aList := OrderedCollection new.
	Object withAllSubclasses do:
		[:c | aList addAll: c allClassVarNames].
	^ aList asSet

	"ScriptingSystem allClassVarNamesInSystem"
