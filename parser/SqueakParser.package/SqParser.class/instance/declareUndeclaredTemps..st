error correction
declareUndeclaredTemps: methodNode 
	"Declare any undeclared temps, declaring them at the smallest
	enclosing scope."
	| undeclared userSelection blocksToVars |
	(undeclared := encoder undeclaredTemps) isEmpty
		ifTrue: [^ self].
	userSelection := cue requestor selectionInterval.
	blocksToVars := IdentityDictionary new.
	undeclared
		do: [:var | (blocksToVars
				at: (var tag == #method
						ifTrue: [methodNode block]
						ifFalse: [methodNode
								accept: (SqVariableScopeFinder new ofVariable: var)])
				ifAbsentPut: [SortedCollection new])
				add: var name].
	(blocksToVars
		removeKey: methodNode block
		ifAbsent: [])
		ifNotNil: [:rootVars | rootVars
				do: [:varName | self pasteTempAtMethodLevel: varName]].
	(blocksToVars keys
		sorted: [:a :b | a tempsMark < b tempsMark])
		do: [:block | 
			| decl |
			decl := (blocksToVars at: block)
						reduce: [:a :b | a , ' ' , b].
			block temporaries isEmpty
				ifTrue: [self
						substituteWord: ' | ' , decl , ' |'
						wordInterval: (block tempsMark + 1 to: block tempsMark)
						offset: requestorOffset]
				ifFalse: [self
						substituteWord: decl , ' '
						wordInterval: (block tempsMark to: block tempsMark - 1)
						offset: requestorOffset]].
	cue requestor selectInvisiblyFrom: userSelection first to: userSelection last + requestorOffset.
	ReparseAfterSourceEditing signal