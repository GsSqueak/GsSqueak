objects from disk
createFrom: aSmartRefStream size: varsOnDisk version: instVarList
	"Create an instance of me so objects on the disk can be read in.  Tricky part is computing the size if variable.  Inst vars will be filled in later.  "

	^ self isVariable
		ifFalse: [self basicNew]
		ifTrue: ["instVarList is names of old class's inst vars plus a version number" 
				self basicNew: (varsOnDisk - (instVarList size - 1))]
