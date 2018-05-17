versionInfo
unloadMonticello
	"self unloadMonticello"
	Utilities breakDependents.
	
	Smalltalk at: #MCWorkingCopy ifPresent:
		[:wc | 
		wc allInstances do:
			[:ea | 
			Versions at: ea package name put: ea currentVersionInfo asDictionary.
			ea breakDependents.
			Smalltalk at: #SystemChangeNotifier ifPresent: [:scn | scn uniqueInstance noMoreNotificationsFor: ea]]
	displayingProgress: 'Saving version info...'].
	
	"keep things simple and don't unload any class extensions"
	(ChangeSet superclassOrder: ((PackageInfo named: 'Monticello') classes)) reverseDo:
		[:ea | 
		ea removeFromSystem].
	
	self registerForFileList.