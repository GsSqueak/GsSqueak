accessing
methodCommentAsBalloonHelp
	"Given that I am a morph that is associated with an object and a method, answer a suitable method comment relating to that object & method if possible"

	| inherentSelector actual |
	(inherentSelector := self valueOfProperty: #inherentSelector)
		ifNotNil:
			[(actual := (self firstOwnerSuchThat:[:m| m isPhraseTileMorph or:[m isSyntaxMorph]]) actualObject) ifNotNil:
				[^ actual class precodeCommentOrInheritedCommentFor: inherentSelector]].
	^ nil