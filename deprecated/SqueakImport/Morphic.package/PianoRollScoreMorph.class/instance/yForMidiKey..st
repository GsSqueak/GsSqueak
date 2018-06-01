geometry
yForMidiKey: midiKey

	^ (bounds bottom - borderWidth - 4) - (3 * (midiKey - lowestNote))
