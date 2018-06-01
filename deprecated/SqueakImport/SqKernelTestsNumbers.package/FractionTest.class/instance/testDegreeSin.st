tests - mathematical functions
testDegreeSin
	"self run: #testDegreeSin"

	-361/3 to: 359/3 do: [:i |
		self assert: (i degreeSin closeTo: i degreesToRadians sin)].