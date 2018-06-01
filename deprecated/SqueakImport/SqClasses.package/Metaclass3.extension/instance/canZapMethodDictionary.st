*SqClasses-testing
canZapMethodDictionary
	"Return true if it is safe to zap the method dictionary on #obsolete"
	destClass == nil
		ifTrue:[^true]
		ifFalse:[^destClass canZapMethodDictionary]
