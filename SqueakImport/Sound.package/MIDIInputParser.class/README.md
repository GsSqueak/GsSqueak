I am a parser for a MIDI data stream. I support:

	real-time MIDI recording,
	overdubbing (recording while playing),
	monitoring incoming MIDI, and
	interactive MIDI performances.

Note: MIDI controllers such as pitch benders and breath controllers generate large volumes of data which consume processor time. In cases where this information is not of interest to the program using it, it is best to filter it out as soon as possible. I support various options for doing this filtering, including filtering by MIDI channel and/or by command type.
