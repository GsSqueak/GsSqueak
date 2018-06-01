*Morphic-Kernel
currentWorld
	"Answer a morphic world that is the current UI focus."
	^ActiveWorld ifNil:[Project current world]