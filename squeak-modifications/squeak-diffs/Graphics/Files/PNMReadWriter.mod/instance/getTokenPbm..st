reading
getTokenPbm: aCollection
	"get a number, return rest of collection"
	| line tokens token |
	tokens := aCollection.
	tokens size = 0 ifTrue:[
		[
			line := self pbmGetLine.
			line ifNil:[^{nil . nil}].
			tokens := line findTokens: ' '.
			tokens size = 0
		] whileTrue:[].
	].
	"Transcript cr; show: tokens asString."
	token := tokens removeFirst.
	^{token asInteger . tokens}
