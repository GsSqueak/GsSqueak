error correction
removeEmptyTempDeclarationsFrom: methodNode 
	| sourceCode madeChanges tempsMarkHolder |
	sourceCode := cue requestor text asString.
	tempsMarkHolder := self collectTemporaryDeclarationsFrom: methodNode.
	madeChanges := false.
	tempsMarkHolder
		do: [:currentBlock | 
			| tempsMarkChar0 tempsMarkChar1 tempsMarkChar2 end start |
			tempsMarkChar0 := sourceCode at: currentBlock tempsMark.
			tempsMarkChar1 := sourceCode at: currentBlock tempsMark - 1.
			tempsMarkChar2 := sourceCode at: currentBlock tempsMark - 2.
			(tempsMarkChar0 == $|
					and: [tempsMarkChar1 == $|])
				ifTrue: [end := currentBlock tempsMark.
					start := end - 1].
			(tempsMarkChar0 == $|
					and: [tempsMarkChar1 == $ 
							and: [tempsMarkChar2 == $|]])
				ifTrue: [end := currentBlock tempsMark.
					start := end - 2].
			(start notNil
					and: [end notNil])
				ifTrue: [| lineStart lineEnd |
					lineStart := 1
								+ (sourceCode lastIndexOf: Character cr startingAt: start - 1).
					lineEnd := sourceCode
								indexOf: Character cr
								startingAt: end + 1
								ifAbsent: [sourceCode size].
					((sourceCode indexOfAnyOf: CharacterSet nonSeparators startingAt: lineStart)
								>= start
							and: [(sourceCode indexOfAnyOf: CharacterSet nonSeparators startingAt: end + 1)
									> lineEnd])
						ifTrue: [start := lineStart.
							end := lineEnd].
					cue requestor
						correctFrom: start
						to: end
						with: ''.
					madeChanges := true.
					currentBlock tempsMark: nil]].
	madeChanges
		ifTrue: [ReparseAfterSourceEditing signal]