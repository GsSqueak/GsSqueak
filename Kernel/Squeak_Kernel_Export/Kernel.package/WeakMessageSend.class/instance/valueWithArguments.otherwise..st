evaluating
valueWithArguments: anArray otherwise: aBlock
	| argsToUse |
	
	"Safe to use, because they are built before ensureing receiver and args..."
	argsToUse := self collectArguments: anArray.
	^ self
		withEnsuredReceiverAndArgumentsDo: [ :r :a |
			r
				perform: selector
				withArguments: argsToUse ]
		otherwise: aBlock