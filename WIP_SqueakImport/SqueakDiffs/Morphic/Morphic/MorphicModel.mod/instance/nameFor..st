compilation
nameFor: aMorph
	"Return the name of the slot containing the given morph or nil if that morph has not been named."

	| allNames start |
	allNames := self class allInstVarNames.
	start := MorphicModel allInstVarNames size + 1.
	start to: allNames size do: [:i |
		(self instVarAt: i) == aMorph ifTrue: [^ allNames at: i]].
	^ nil
