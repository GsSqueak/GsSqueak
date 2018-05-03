simulation only
preGCAction: fullGCFlag
	"hack around the CoInterpreter/ObjectMemory split refactoring"
	^coInterpreter preGCAction: fullGCFlag