displaying
fontDisplay
	"TextStyle default defaultFont fontDisplay."

	Display restoreAfter:
		[(Form extent: 440@400) displayAt: 90@90.
		 0 to: 15 do:
			[:i |
			i storeStringHex displayAt: 100 @ (20 * i + 100).
			0 to: 15 do:
				[:j |
				((16*i+j) between: 1 and: (self xTable size - 2)) ifTrue:
					[(self characterFormAt: (16 * i + j) asCharacter)
						displayAt: (20 * j + 150) @ (20 * i + 100)]]].
			'Click to continue...' asDisplayText displayAt: 100@450]