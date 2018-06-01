accessing
infoForTrack: i
	"Return the info string for the given track."
	"Note: MIDI files follow varying conventions on their use of comment strings. Often, the first string in the track suggests the role of that track in the score, such as 'flute 1' or 'soprano'."

	^ score trackInfo at: i
