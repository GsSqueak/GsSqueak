*Morphic-Sounds
playStream: binaryStream

	ScorePlayerMorph
		openOn: (self scoreFromStream: binaryStream)
		title: 'a MIDI stream'
