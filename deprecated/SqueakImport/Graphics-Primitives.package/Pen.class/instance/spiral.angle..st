geometric designs
spiral: n angle: a 
	"Draw a double squiral (see Papert, MindStorms), where each design is made
	by moving the receiver a distance of n after turning the amount + or -a."

	1 to: n do: 
		[:i | 
		self color: i * 2.
		self go: i; turn: a]
"
	Display restoreAfter: [
		Display fillWhite. Pen new spiral: 200 angle: 89; home; spiral: 200 angle: -89].
"