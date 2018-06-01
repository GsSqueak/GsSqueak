balloon help
addBalloonHelp: aBalloonMorph 
	"Associate a new balloon morph with this hand."
	self removeAlarm: #spawnBalloonFor:.
	aBalloonMorph
		ifNotNil: [:m | self balloonHelpList add: m]