geometric designs
dragon: n  "Display restoreAfter: [Display fillWhite. Pen new dragon: 10]."
	"Display restoreAfter: [Display fillWhite. 1 to: 4 do:
				[:i | Pen new color: i; turn: 90*i; dragon: 10]]"
	"Draw a dragon curve of order n in the center of the screen."
	n = 0
		ifTrue: [self go: 5]
		ifFalse: [n > 0
				ifTrue: [self dragon: n - 1; turn: 90; dragon: 1 - n]
				ifFalse: [self dragon: -1 - n; turn: -90; dragon: 1 + n]]
