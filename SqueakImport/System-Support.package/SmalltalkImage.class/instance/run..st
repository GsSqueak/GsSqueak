command line
run: aBlock
	[ [ self patchSystem.
	(aBlock numArgs = 1 and: [ self arguments size > 1 ])
		ifTrue: [ "Allow a large, variable number of arguments to be passed as an Array to aBlock."
			aBlock value: self arguments ]
		ifFalse: [ aBlock valueWithEnoughArguments: self arguments ] ]
		on: ProgressInitiationException
		do:
			[ : pie | "Don't want to log this notification."
			pie defaultAction ] ]
		on: Notification , Warning
		do:
			[ : noti | FileStream stdout
				 nextPutAll: DateAndTime now asString ;
				 space ;
				 nextPutAll: noti description ;
				 cr.
			noti resume ]
		on: SyntaxErrorNotification
		do:
			[ : err | FileStream stdout
				 nextPutAll: err errorCode ;
				 cr; flush.
			self isHeadless
				ifTrue: [ self snapshot: false andQuit: true ]
				ifFalse: [ err pass ] ]
		on: Error
		do:
			[ : err | err printVerboseOn: FileStream stderr.
			FileStream stderr flush.
			self isHeadless
				ifTrue: [ self snapshot: false andQuit: true ]
				ifFalse: [ err pass ] ]