*Morphic-MorphicExtras-flaps
deleteAllFlapArtifacts
	"self currentWorld deleteAllFlapArtifacts"

	self submorphs do:[:m | m wantsToBeTopmost ifTrue:[m delete]].