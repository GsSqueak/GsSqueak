evaluating
valueOtherwise: aBlock

	^ arguments
		ifNil: [
			self withEnsuredReceiverDo: [ :r | r perform: selector ] otherwise: aBlock ]
		ifNotNil: [
			self
				withEnsuredReceiverAndArgumentsDo: [ :r :a |
					r
						perform: selector
						withArguments: a ]
				otherwise: aBlock ]