selecting
editState
	| textState |
	textState := WeakIdentityKeyDictionary new.
	modelDependents do:
		[:dep|
		dep canHaveUnacceptedEdits ifTrue:
			[textState at: dep put: dep unacceptedEditState]].
	^textState