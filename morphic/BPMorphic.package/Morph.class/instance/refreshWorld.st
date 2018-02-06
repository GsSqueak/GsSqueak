drawing
refreshWorld
	"If this morph is in a world, refresh the world. This can be used to
	immediately redraw a morph after it changed. Note that you should
	use this call rather sparsely because it bypasses Morphics damage
	recording mechanism."
	self world
		ifNotNil: [:w | w displayWorldSafely]