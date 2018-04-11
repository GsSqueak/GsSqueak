*SqClasses-compiling
compile: text classified: category withStamp: changeStamp notifying: requestor logSource: logSource 
	| methodAndNode selector |
	methodAndNode := self
		compile: text asString
		notifying: requestor
		trailer: (self defaultMethodTrailerIfLogSource: logSource)
		ifFail: [ ^ nil ].
	selector := methodAndNode selector.
	logSource ifTrue:
		[ self
			logMethodSource: text
			forMethodWithNode: methodAndNode
			inCategory: category
			withStamp: changeStamp
			notifying: requestor.
		RecentMessages default
			recordSelector: selector
			forClass: methodAndNode method methodClass
			inEnvironment: CurrentEnvironment signal ].
	self
		addAndClassifySelector: selector
		withMethod: methodAndNode method
		inProtocol: category
		notifying: requestor.
	self instanceSide
		noteCompilationOf: selector
		meta: self isClassSide.
	^ selector
