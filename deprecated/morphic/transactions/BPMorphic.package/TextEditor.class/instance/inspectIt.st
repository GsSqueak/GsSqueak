do-its
inspectIt
	self
		evaluateSelectionAndDo: [:result | (model respondsTo: #inspectIt:result:)
				ifTrue: [model
						perform: #inspectIt:result:
						with: self selection
						with: result]
				ifFalse: [result inspect]]