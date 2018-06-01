scrolling
notesInRect: timeSlice

	^ self submorphsSatisfying:
		[:m | (timeSlice intersects: m bounds)
				and: [m isKindOf: PianoRollNoteMorph]]