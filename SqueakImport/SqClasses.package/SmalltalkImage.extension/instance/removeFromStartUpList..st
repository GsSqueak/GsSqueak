*SqClasses-*SqClasses-*SqClasses-snapshot and quit
removeFromStartUpList: aClass

	StartUpList remove: aClass name ifAbsent: []
