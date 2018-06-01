error correction
removeUnusedTemps: methodNode 
	"Scan for unused temp names, and prompt the user about the
	prospect of removing each one found"
	| madeChanges tempsMarkHolder unusedTempNames tempMarkHoldersToChange |
	madeChanges := false.
	tempMarkHoldersToChange := OrderedCollection new.
	tempsMarkHolder := self collectTemporaryDeclarationsFrom: methodNode.
	unusedTempNames := encoder unusedTempNames
				select: [:temp | (encoder
							lookupVariable: temp
							ifAbsent: []) isUndefTemp
						and: [self queriedUnusedTemporaries
								at: temp
								ifAbsentPut: [UnusedVariable name: temp]]].
	tempsMarkHolder
		do: [:currentBlock | 
			tempMarkHoldersToChange add: currentBlock.
			unusedTempNames
				do: [:temp | (self
							removeUnusedTemporaryNamed: temp
							from: cue requestor text asString
							lookingAt: currentBlock
							movingTempMarksOf: tempMarkHoldersToChange)
						ifTrue: [madeChanges := true]]].
	madeChanges
		ifTrue: [self removeEmptyTempDeclarationsFrom: methodNode.
			ReparseAfterSourceEditing signal]