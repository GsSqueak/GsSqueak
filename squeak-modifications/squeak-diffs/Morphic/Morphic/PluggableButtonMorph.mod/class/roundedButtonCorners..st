preferences
roundedButtonCorners: aBoolean

	| world |
	RoundedButtonCorners := aBoolean.
	world := Project current world.
	world invalidRect: world bounds from: world.