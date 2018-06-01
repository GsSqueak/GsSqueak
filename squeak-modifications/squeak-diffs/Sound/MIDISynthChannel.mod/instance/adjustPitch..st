other
adjustPitch: bend
	"Handle a pitch-bend change."

	| pitchAdj |
	pitchBend := bend.
	pitchAdj := 2.0 raisedTo: (bend asFloat / 8192.0) / 6.0.
	activeSounds copy do: [:entry | | snd centerPitch |
		snd := entry at: 2.
		centerPitch := entry at: 3.
		snd pitch: pitchAdj * centerPitch.
		snd internalizeModulationAndRatio].
