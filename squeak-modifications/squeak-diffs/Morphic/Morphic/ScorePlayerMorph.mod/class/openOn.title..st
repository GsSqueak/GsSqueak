system hookup
openOn: aScore title: aString

	| player |
	player := ScorePlayer onScore: aScore.
	(self new onScorePlayer: player title: aString) openInWorld.
