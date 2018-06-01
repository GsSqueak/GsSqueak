operations
addWindow: aModel
	aModel multiWindowState: self.
	self assert: models size = modelStates size.
	models := models
					copyReplaceFrom: currentModelIndex + 1
					to: currentModelIndex
					with: (Array with: aModel).
	modelStates := modelStates
					copyReplaceFrom: currentModelIndex + 1
					to: currentModelIndex
					with: (Array with: self emptyEditState).
	self assert: models size = modelStates size.
	self selectWindowIndex: (currentModelIndex = 0 ifTrue: [currentModelIndex := 1] ifFalse: [currentModelIndex + 1]).
	self assert: models size = modelStates size.
	1 to: models size do:
		[:idx|
		self assert: (idx = currentModelIndex
					or: [(modelStates at: idx) isArray and: [(modelStates at: idx) size = 2]])]