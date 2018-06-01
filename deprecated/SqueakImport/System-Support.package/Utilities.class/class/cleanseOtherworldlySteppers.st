miscellaneous
cleanseOtherworldlySteppers
	"If the current project is a morphic one, then remove from its steplist those morphs that are not really in the world"

	| old delta |
	Smalltalk isMorphic ifTrue:
		[old := self currentWorld stepListSize.
		self currentWorld steppingMorphsNotInWorld do: [:m | m delete].
		self currentWorld cleanseStepList.
		(delta := (old - self currentWorld stepListSize)) > 0 ifTrue:
			[Transcript cr; show: (delta asString, ' morphs removed from steplist')]]

	"Utilities cleanseOtherworldlySteppers"