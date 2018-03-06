closure analysis
nilReadBeforeWrittenTemps
	| visitor readBeforeWritten |
	temporaries isEmpty
		ifTrue: [^ self].
	self accept: (visitor := SqOptimizedBlockLocalTempReadBeforeWrittenVisitor new).
	readBeforeWritten := visitor readBeforeWritten.
	temporaries
		reverseDo: [:temp | ((readBeforeWritten includes: temp)
					and: [temp isRemote not])
				ifTrue: [statements
						addFirst: (SqAssignmentNode new variable: temp value: NodeNil)]]