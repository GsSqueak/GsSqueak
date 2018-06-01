do-its
exploreIt

	 self evaluateSelectionAndDo: [:result |
		(model respondsTo: #exploreIt:result:)
			ifTrue: [model
				perform: #exploreIt:result:
				with: self selection
				with: result]
			ifFalse: [result explore]].