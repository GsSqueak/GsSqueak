geometric designs
filberts: n side: s   "Display restoreAfter: [Pen new filberts: 4 side: 5]"
	"Two Hilbert curve fragments form a Hilbert tile. Draw four interlocking 
	tiles of order n and sides length s."
	| n2 |
	Display fillWhite.
	n2 := 1 bitShift: n - 1.
	self up; go: 0 - n2 * s; down.
	1 to: 4 do: 
		[:i | 
		self fill: [:p |
				p hilbert: n side: s.
				p go: s.
				p hilbert: n side: s.
				p go: s.
				p up.
				p go: n2 - 1 * s.
				p turn: -90.
				p go: n2 * s.
				p turn: 180.
				p down]
			color: (Color perform: (#(yellow red green blue) at: i))]