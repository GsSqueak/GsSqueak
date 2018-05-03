simulation only
postGCAction: fullGCFlag
	"hack around the CoInterpreter/ObjectMemory split refactoring"
	^coInterpreter postGCAction: fullGCFlag