world state
someHalo
	"Return some halo that's currently visible in the world"
	| m |
	^ (m := self haloMorphs) notEmpty
		ifTrue: [m first]