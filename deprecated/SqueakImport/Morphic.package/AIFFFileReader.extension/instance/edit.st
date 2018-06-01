*Morphic-MorphicExtras-Sound
edit

	| ed |
	ed := WaveEditor new.
	ed data: channelData first.
	ed loopEnd: markers last last.
	ed loopLength: (markers last last - markers first last) + 1.
	ed openInWorld.
