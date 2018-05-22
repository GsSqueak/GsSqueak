stepping
localHaloBoundsFor: aMorph

	"aMorph may be in the hand and perhaps not in our world"

	| r |

	r := aMorph worldBoundsForHalo truncated.
	aMorph world = self world ifFalse: [^r].
	^((self transformFromOutermostWorld) globalBoundsToLocal: r) truncated