accessing
hasTranslucentColor
	"Answer true if this any of this morph is translucent but not transparent."

	(color isColor and: [color isTranslucentColor]) ifTrue: [^ true].
	(fillColor2 isColor and: [fillColor2 isTranslucentColor]) ifTrue: [^ true].
	^ false
