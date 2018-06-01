instance creation
string: str for: morph corner: cornerName 
	"Make up and return a balloon for morph. Find the quadrant that 
	clips the text the least, using cornerName as a tie-breaker. tk 9/12/97"
	| text vertices balloon |
	balloon := self new.
	text := self
		getTextMorph: (str asString withNoLineLongerThan: Preferences maxBalloonHelpLineLength)
		for: morph.
	balloon userInterfaceTheme textColor ifNotNil:
		[:col | text color: col].
	balloon userInterfaceTheme font ifNotNil: [ : font | text font: font ].
	vertices := self getVertices: text bounds.
	vertices := self
		getBestLocation: vertices
		for: morph
		corner: cornerName.
	^ balloon
		 color: morph balloonColor ;
		 setVertices: vertices ;
		 addMorph: text ;
		 setTarget: morph