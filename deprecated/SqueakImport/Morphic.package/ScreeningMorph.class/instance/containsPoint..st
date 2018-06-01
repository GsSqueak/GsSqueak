geometry testing
containsPoint: aPoint
	submorphs size = 2 ifFalse: [^ super containsPoint: aPoint].
	^ self screenMorph containsPoint: aPoint