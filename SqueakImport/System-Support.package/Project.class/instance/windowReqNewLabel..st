initialization
windowReqNewLabel: newLabel
	newLabel isEmpty ifTrue: [^ false].
	newLabel = changeSet name ifTrue: [^ true].
	(ChangeSet named: newLabel) == nil
		ifFalse: [self inform: 'Sorry that name is already used'.
				^ false].
	changeSet name: newLabel.
	^ true