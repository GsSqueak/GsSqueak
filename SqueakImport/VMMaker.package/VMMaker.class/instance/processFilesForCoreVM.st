processing external files
processFilesForCoreVM
	"process any cross-platform files from the crossPlatformDir and then any files relating to the core vm from the platformDirectory's vm subdirectory."
	"This is a stub ready for collecting all the filenames etc that might be needed to write a makefile. No details are yet certain."

	| vmDirName fList |
	vmDirName := self class coreVMDirName.
	fList := OrderedCollection new.
	{self crossPlatformDirectory directoryNamed: vmDirName.
	self platformDirectory directoryNamed: vmDirName.
	self coreVMDirectory}
		do:[:dir| fList addAll: (self nonAdminFilesIn: dir)].
	allFilesList at: 'vm' put: fList
