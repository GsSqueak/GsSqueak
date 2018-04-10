-Etoys-utilities
spaceReclaimed
	"Reclaim space from the EToy system, and return the number of bytes
	reclaimed "
	"ScriptingSystem spaceReclaimed"
	| _gsSqueakTemp_oldFree |
	_gsSqueakTemp_oldFree := Smalltalk garbageCollect.
	ThumbnailMorph recursionReset.
	Player removeUninstantiatedSubclassesSilently.
	Smalltalk cleanOutUndeclared.
	Smalltalk reclaimDependents.
	^ Smalltalk garbageCollect - _gsSqueakTemp_oldFree