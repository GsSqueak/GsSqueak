*SqClasses-*SqClasses-*SqClasses-class initialization
startUp: resuming
	resuming ifTrue:
		[LastStats := nil.
		 SystemChangeNotifier uniqueInstance notify: Smalltalk ofAllSystemChangesUsing: #event:]
