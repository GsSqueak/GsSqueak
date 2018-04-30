geometric designs
hilberts: n   "Display restoreAfter: [Display fillWhite.  Pen new hilberts: 5]"
	"Draws n levels of nested Hilbert curves"
	| s |
	self up; turn: 90; go: 128; down.
	1 to: n do: 
		[:i | 
		s := 256 bitShift: 0 - i.
		self defaultNib: n - i * 2 + 1.
		self color: i+1.
		self up; go: 0 - s / 2; turn: -90; go: s / 2; turn: 90; down.
		self hilbert: i side: s.
		self go: s.
		self hilbert: i side: s.
		self go: s]