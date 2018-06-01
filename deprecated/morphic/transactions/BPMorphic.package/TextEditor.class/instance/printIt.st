do-its
printIt
	self
		evaluateSelectionAndDo: [:result | (model respondsTo: #printIt:result:)
				ifTrue: [model
						perform: #printIt:result:
						with: self selection
						with: result]
				ifFalse: [self afterSelectionInsertAndSelect: result printString]]