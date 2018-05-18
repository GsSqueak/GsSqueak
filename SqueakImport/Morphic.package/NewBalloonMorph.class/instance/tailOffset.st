geometry
tailOffset

	^ (Dictionary newFrom: {
		#topLeft -> (5@0).
		#topRight -> (-3@0).
		#bottomLeft -> (1@ -1).
		#bottomRight -> (-3 @ -3)}) at: self orientation