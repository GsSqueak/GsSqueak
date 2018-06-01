slot-kedama
isPrototypeTurtlePlayer
	^ false"
	costume ifNil: [^ false].
	^ costume renderedMorph isMemberOf: KedamaTurtleMorp
	"