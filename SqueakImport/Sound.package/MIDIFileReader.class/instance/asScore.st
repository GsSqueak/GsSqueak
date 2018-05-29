chunk reading
asScore

	^ MIDIScore new
		tracks: tracks;
		trackInfo: trackInfo;
		tempoMap: tempoMap;
		ticksPerQuarterNote: ticksPerQuarter;
		source: stream localName
