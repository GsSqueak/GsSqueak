instance creation
descriptionFullNamed: descriptionFullName at: index
	| ans |
	ans := Descriptions
		detect: [:f | f first fullName = descriptionFullName]
		ifNone: [Default].
	index > 0 ifTrue: [^ ans at: index].
	^ ans.
