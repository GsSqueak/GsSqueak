-Ocompletion
completionController
	| _gsSqueakTemp_controller |
	_gsSqueakTemp_controller := self dependents
				detect: [:each | each isKindOf: ECController]
				ifNone: ["This is just the migration code from the old
					#actionMap hack."
					(self triggerEvent: #getCompletionController)
						ifNotNil: [:theController | self addDependent: theController]].
	^ _gsSqueakTemp_controller
		ifNil: [self initializeCompletionController]