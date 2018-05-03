tests - mathematical functions
testDegreeCos
	"self run: #testDegreeCos"
	
	-361/3 to: 359/3 do: [:i |
		self assert: (i degreeCos closeTo: i degreesToRadians cos)].