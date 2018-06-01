examples
colorRampForDepth: depth extent: aPoint
	"Returns a form of the given size showing R, G, B, and gray ramps for the given depth. Useful for testing color conversions between different depths."
	"(Color colorRampForDepth: Display depth extent: 256@80) display"
	"(Color colorRampForDepth: 32 extent: 256@80) displayOn: Display at: 0@0 rule: Form paint"

	| f dx dy r |
	f := Form extent: aPoint depth: depth.
	dx := aPoint x // 256.
	dy := aPoint y // 4.
	0 to: 255 do: [:i |
		r := (dx * i)@0 extent: dx@dy.
		f fill: r fillColor: (Color r: i g: 0 b: 0 range: 255).
		r := r translateBy: 0@dy.
		f fill: r fillColor: (Color r: 0 g: i b: 0 range: 255).
		r := r translateBy: 0@dy.
		f fill: r fillColor: (Color r: 0 g: 0 b: i range: 255).
		r := r translateBy: 0@dy.
		f fill: r fillColor: (Color r: i g: i b: i range: 255)].
	^ f
