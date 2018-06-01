macpal
isUniversalTiles
	"Return true if I (my world) uses universal tiles. This message can be
	called in places where the current World is not known, such as when
	writing out a project. For information about the writingUniversalTiles
	thing, contact Ted Kaehler."
	^ costume world
		ifNil: [ScriptEditorMorph writingUniversalTiles == true
			"only valid during a project write"]
		ifNotNil: [Preferences universalTiles]