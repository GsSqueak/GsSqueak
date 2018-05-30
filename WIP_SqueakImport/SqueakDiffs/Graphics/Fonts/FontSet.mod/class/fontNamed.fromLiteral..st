installing
fontNamed: fontName fromLiteral: aString
	"NOTE -- THIS IS AN OBSOLETE METHOD THAT MAY CAUSE ERRORS.

The old form of fileOut for FontSets produced binary literal strings which may not be accurately read in systems with support for international character sets.  If possible, file the FontSet out again from a system that produces the newer MIME encoding (current def of compileFont:), and uses the corresponding altered version of this method.  If this is not easy, then
	file the fontSet into an older system (3.7 or earlier),
	assume it is called FontSetZork...
	execute FontSetZork installAsTextStyle.
	copy the compileFont: method from this system into that older one.
	remove the class FontSetZork.
	Execute:  FontSet convertTextStyleNamed: 'Zork', and see that it creates a new FontSetZork.
	FileOut the new class FontSetZork.
	The resulting file should be able to be read into this system.
"

	^ StrikeFont new 
		name: fontName;
		readFromStrike2Stream: (ReadStream on: aString asByteArray)