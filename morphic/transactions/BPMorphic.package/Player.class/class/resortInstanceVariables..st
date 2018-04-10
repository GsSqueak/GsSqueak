user-defined inst vars
resortInstanceVariables: newList 
	"Accept a new ordering for instance variables"
	variableDocks := newList
				collect: [:aName | variableDocks
						detect: [:d | d variableName = aName]].
	self setNewInstVarNames: newList asOrderedCollection.
	self newVariableDocks: variableDocks