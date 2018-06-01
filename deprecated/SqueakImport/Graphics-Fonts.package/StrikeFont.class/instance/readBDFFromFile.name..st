file in/out
readBDFFromFile: fileName name: aString 
	"This builds a StrikeFont instance by reading the X11 Binary 
	Distribution Format font source file.  See the BDFFontReader class
	comment."

	"StrikeFont new readBDFFromFile: 'helvR12' name: 'Helvetica12'."

	| fontReader stream |
	fontReader := BDFFontReader openFileNamed: fileName.
	stream := ReadStream on: fontReader read.
	xTable := stream next.
	glyphs := stream next.
	minAscii := stream next.
	maxAscii := stream next.
	maxWidth := stream next.
	ascent := stream next.
	descent := stream next.
	pointSize := stream next.
	name := aString.
"	xTable size <= 256 ifTrue: [self setStopConditions]."
	type := 0.	"no one see this"
	superscript := (ascent - descent) // 3.
	subscript := (descent - ascent) // 3.
	emphasis := 0.
	self reset