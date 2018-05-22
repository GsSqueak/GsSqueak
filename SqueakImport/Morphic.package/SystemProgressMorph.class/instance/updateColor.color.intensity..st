initialization
updateColor: aMorph color: aColor intensity: anInteger 
	"update the apareance of aMorph"
	| fill cc |
	MenuMorph gradientMenu
		ifFalse: [^ self].

	
	cc := aColor adjustSaturation: -0.08 brightness: 0.4.
	fill := GradientFillStyle ramp: {
		0.0 -> cc. 
		0.25 -> (aColor mixed: 0.5 with: cc). 
		1.0 -> aColor}.
	
	fill radial: false;
		origin: aMorph topLeft;
		direction: 0 @ aMorph height.
	aMorph fillStyle: fill