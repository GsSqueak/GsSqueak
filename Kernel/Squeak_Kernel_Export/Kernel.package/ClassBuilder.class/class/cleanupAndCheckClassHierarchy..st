cleanup obsolete classes
cleanupAndCheckClassHierarchy: informer
	"Makes the class hierarchy consistent and removes obsolete classes from the SystemDictionary.
	Afterwards it checks whether the hierarchy is really consistent."

	Transcript cr; show: '*** Before cleaning up ***'.
	self countReallyObsoleteClassesAndMetaclasses.
	self cleanupClassHierarchy: informer.
	self checkClassHierarchyConsistency: informer.
	Transcript cr; cr; show: '*** After cleaning up ***'.
	self countReallyObsoleteClassesAndMetaclasses.