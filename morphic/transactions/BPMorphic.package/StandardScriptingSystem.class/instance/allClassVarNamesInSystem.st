utilities
allClassVarNamesInSystem
	"Compute and answer a set of all the class variable names known to
	the sytem from any class"
	| _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := OrderedCollection new.
	Object withAllSubclasses
		do: [:c | _gsSqueakTemp_aList addAll: c allClassVarNames].
	^ _gsSqueakTemp_aList asSet"ScriptingSystem allClassVarNamesInSystem"