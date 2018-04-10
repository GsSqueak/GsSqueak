-Etoys
trailMorph
	"You can't draw trails on me, but try my owner."
	owner isNil
		ifTrue: [^ nil].
	^ owner trailMorph