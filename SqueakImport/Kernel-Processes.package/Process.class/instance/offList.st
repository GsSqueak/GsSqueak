accessing
offList
	"OBSOLETE. Process>>suspend will atomically reset myList if the process is suspended. 
	There should never be a need to send #offList but some older users may not be aware 
	of the changed semantics to suspend and may try the old hickadidoo seen here:

		(suspendingList := process suspendingList) == nil
			ifTrue: [process == Processor activeProcess ifTrue: [process suspend]]
			ifFalse: [suspendingList remove: process ifAbsent:[].
					process offList].

	Usages like the above should be replaced by a simple 'process suspend' "
	myList := nil