structure
morphPreceding: aSubmorph
	"Answer the morph immediately preceding aSubmorph, or nil if none"

	| index |
	(index := submorphs indexOf: aSubmorph) > 1 ifTrue: [
		^submorphs at: index - 1 ].
	^nil