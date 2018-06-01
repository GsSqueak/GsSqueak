balloon help
resetBalloonHelp: aBalloonMorph
	"Associate a new balloon morph with this hand. Remove all other ones."

	self
		deleteBalloonTarget: nil;
		addBalloonHelp: aBalloonMorph.