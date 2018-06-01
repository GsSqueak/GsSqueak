dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	^ ((aMorph ~~ self) and: [aMorph ~~ ScrapBook default scrapBook]) and:
		[aMorph willingToBeDiscarded]