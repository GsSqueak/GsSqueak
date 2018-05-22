halos and balloon help
createHalo

	^ (Smalltalk at: self haloClass ifAbsent: [HaloMorph]) new
		bounds: self worldBoundsForHalo
		yourself