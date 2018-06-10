instance creation
diffTypeFrom: oldVersion to: newVersion

	(oldVersion isNil and: [newVersion notNil]) ifTrue: [^ self creationType].
	(oldVersion notNil and: [newVersion isNil]) ifTrue: [^ self removalType].
	oldVersion ~= newVersion ifTrue: [^ self modificationType].
	^ self unmodifiedType