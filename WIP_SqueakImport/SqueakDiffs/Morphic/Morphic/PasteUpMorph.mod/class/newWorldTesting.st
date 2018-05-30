*Morphic-MorphicExtras-project
newWorldTesting

	| world ex |

	ex := 500@500.
	world := PasteUpMorph newWorldForProject: nil.
	world extent: ex; color: Color orange.
	world openInWorld.
	world viewBox: (0@0 extent: ex).
	BouncingAtomsMorph new openInWorld: world.

"-----

	| world window |
	world := PasteUpMorph newWorldForProject: nil.
	world extent: 300@300; color: Color orange.
	world viewBox: (0@0 extent: 300@300).
	window := (SystemWindow labelled: 'the new world') model: world.
	window color: Color orange.
	window addMorph: world frame: (0@0 extent: 1.0@1.0).
	window openInWorld.

---"
