code generation
emitCodeForEvaluatedClosureValue: stack encoder: encoder 
	| position |
	position := stack position.
	stack position: arguments size + temporaries size + copiedValues size.
	encoder genPushNClosureTemps: temporaries size.
	self
		reindexingLocalsDo: [self emitCodeForEvaluatedValue: stack encoder: encoder]
		encoder: encoder.
	self returns
		ifFalse: [encoder genReturnTopToCaller.
			pc := encoder methodStreamPosition].
	stack position: position