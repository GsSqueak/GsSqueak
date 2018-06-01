scripting
authoringPrototype
	"Answer an instance of the receiver suitable for placing in a parts bin"

	| proto |
	proto := super authoringPrototype.
	proto color: (Color r: 0.972 g: 0.972 b: 0.662).
	^ proto