geometry
midiKeyForY: y

	^ lowestNote - ((y - (bounds bottom - borderWidth - 4)) // 3)
