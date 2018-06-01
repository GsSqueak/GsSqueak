*Morphic-Sounds
playFileNamed: fileName

	ScorePlayerMorph
		openOn: (self scoreFromFileNamed: fileName)
		title: (FileDirectory localNameFor: fileName).
