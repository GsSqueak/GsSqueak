accessing
label: aStringOrTextOrMorph 
	label = aStringOrTextOrMorph
		ifTrue: [^ self].
	label := aStringOrTextOrMorph isString
				ifTrue: [aStringOrTextOrMorph]
				ifFalse: [aStringOrTextOrMorph asMorph].
	self updateMinimumExtent.
	self changed