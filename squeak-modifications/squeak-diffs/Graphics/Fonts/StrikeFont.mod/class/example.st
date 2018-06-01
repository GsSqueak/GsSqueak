examples
example
	"Displays a line of text on the display screen at the location of the cursor.
	Example depends on the strike font file, 'TimesRoman10.strike'. existing."

	(StrikeFont new readFromStrike2: 'NewYork12.sf2')
		displayLine: 'A line of 12-pt text in New York style' at: Sensor cursorPoint
	 
	"StrikeFont example."