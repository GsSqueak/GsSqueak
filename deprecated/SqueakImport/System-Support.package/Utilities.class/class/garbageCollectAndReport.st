miscellaneous
garbageCollectAndReport
	"Do a garbage collection, and report results to the user."

	| reportString |
	reportString := String streamContents:
		[:aStream | 
			aStream 
				nextPutAll: 'The following amounts of memory are still available:' translated;
				cr.
			aStream nextPutAll: Smalltalk bytesLeftString.
			Smalltalk at: #Command ifPresent:
				[:cmdClass | | cc |
				(cc := cmdClass instanceCount) > 0 ifTrue:
					[aStream 
						cr; 
						nextPutAll: '(note: there are ';
						print: cc;
						nextPutAll: ' undo record(s) present in your';
						cr;
						nextPutAll: 'system; purging them may free up more space.)']]].
			
	self inform: reportString
