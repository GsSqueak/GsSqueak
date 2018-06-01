initialization
fileIn: anEnvironment
	"File the receiver in.  If I represent a method or a class-comment, file the method in and make a note of it in the recent-submissions list; if I represent a do-it, then, well, do it; if I represent a reorganization then get organized!"

	Cursor read showWhile:
		[| s cls aSelector |
		type == #doIt
			ifTrue:
				[((s := self string) beginsWith: '----') ifFalse: [Compiler evaluate: s]]
			ifFalse:
				[cls := self methodClass: anEnvironment.
				 type == #method ifTrue:
					[[cls compile: self text classified: category withStamp: stamp notifying: nil]
					on: CurrentEnvironment do: [:e | e resume: anEnvironment].
					(aSelector := self methodSelector) ifNotNil:
						[RecentMessages default recordSelector: aSelector forClass: cls inEnvironment: anEnvironment]].
				 type == #classComment ifTrue:
					[cls comment: self text stamp: stamp.
					RecentMessages default recordSelector: #Comment forClass: cls inEnvironment: anEnvironment].
				 type == #reorganize ifTrue:
					[cls organization changeFromString: self text]]]