kedama
getColorFromKedamaWorldIfPossible: aGlobalPoint

	self world submorphs do: [:sub |
		 (sub isKedamaMorph) ifTrue: [
			sub morphsAt: aGlobalPoint unlocked: false do: [:e |
				^ e colorAt: (aGlobalPoint - e topLeft).
			].
		].
	].
	^ nil.
