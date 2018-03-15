miscellaneous
cleanseOtherworldlySteppers
	"If the current project is a morphic one, then remove from its steplist
	those morphs that are not really in the world"
	| _gsSqueakTemp_old _gsSqueakTemp_delta |
	Smalltalk isMorphic
		ifTrue: [_gsSqueakTemp_old := self currentWorld stepListSize.
			self currentWorld steppingMorphsNotInWorld
				do: [:m | m delete].
			self currentWorld cleanseStepList.
			(_gsSqueakTemp_delta := _gsSqueakTemp_old - self currentWorld stepListSize) > 0
				ifTrue: [Transcript cr; show: _gsSqueakTemp_delta asString , ' morphs removed from steplist']
			"Utilities cleanseOtherworldlySteppers"]