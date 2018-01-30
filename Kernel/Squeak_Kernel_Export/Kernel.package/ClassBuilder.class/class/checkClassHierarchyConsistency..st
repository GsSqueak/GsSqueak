cleanup obsolete classes
checkClassHierarchyConsistency: informer
	"Check the consistency of the class hierarchy. The class hierarchy is consistent if the following
	two logical equivalences hold for classes A and B:
	- B is obsolete and 'B superclass' yields A  <-->  'A obsoleteSubclasses' contains B
	- B is not obsolete and 'B superclass' yields A  <-->  'A subclasses' contains B"
	| classes |
	Transcript cr; show: 'Start checking the class hierarchy...'.
	Smalltalk garbageCollect.
	classes := Metaclass allInstances.
	classes keysAndValuesDo: [:index :meta |
		informer value:'Validating class hierarchy ', (index * 100 // classes size) printString,'%'.
		meta allInstances do: [:each | self checkClassHierarchyConsistencyFor: each].
		self checkClassHierarchyConsistencyFor: meta.
	].
	Transcript show: 'OK'.