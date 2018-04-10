accessing
methodCommentAsBalloonHelp
	"Given that I am a morph that is associated with an object and a
	method, answer a suitable method comment relating to that object &
	method if possible"
	(self valueOfProperty: #inherentSelector)
		ifNotNil: [:inherentSelector | (self
				firstOwnerSuchThat: [:m | m isPhraseTileMorph
						or: [m isSyntaxMorph]]) actualObject
				ifNotNil: [:actual | ^ actual class precodeCommentOrInheritedCommentFor: inherentSelector]].
	^ nil