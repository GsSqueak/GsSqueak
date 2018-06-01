viewer
uniqueNameForReference
	"Answer a unique name for referring to the receiver"
	| _gsSqueakTemp_itsReferent |
	self flag: #deferred.
	"The once-and-maybe-future ObjectRepresentativeMorph scheme is for
	the moment disenfranchised"
	"(costume isKindOf: ObjectRepresentativeMorph) ifTrue:
	[((itsReferent := costume objectRepresented) isKindOf: Class)
	ifTrue:
	[^ itsReferent name].
	itsReferent == Smalltalk ifTrue: [^ #Smalltalk].
	itsReferent == ScriptingSystem ifTrue: [^ #ScriptingSystem]]."
	^ super uniqueNameForReference