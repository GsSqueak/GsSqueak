accessing
label: aStringOrTextOrMorph

	label = aStringOrTextOrMorph ifTrue: [^ self].
	label := aStringOrTextOrMorph isString
		ifFalse: [aStringOrTextOrMorph asMorph]
		ifTrue: [aStringOrTextOrMorph].
	
	self updateMinimumExtent.
	self changed.