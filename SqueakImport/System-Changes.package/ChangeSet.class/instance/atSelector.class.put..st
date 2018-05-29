method changes
atSelector: selector class: class put: changeType

	selector isDoIt ifTrue: [^ self].
	(self changeRecorderFor: class) atSelector: selector put: changeType.
