selecting
restoreEditState: aWeakDictionary
	aWeakDictionary keysAndValuesDo:
		[:depOrNil :unacceptedEditState|
		depOrNil ifNotNil:
			[depOrNil unacceptedEditState: unacceptedEditState]]