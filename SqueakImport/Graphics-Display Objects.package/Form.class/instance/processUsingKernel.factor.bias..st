processing
processUsingKernel: filter factor: factor bias: bias
	| image result |

	image := self.
	result := Form extent: image extent depth: image depth.

	0 to: image height - 1 do: [:y |
		0 to: image width - 1 do: [:x |
			| r g b |
			r := g := b := 0.0.

			0 to: filter rowCount - 1 do: [:filterY |
				0 to: filter columnCount - 1 do: [:filterX |
					| imageX imageY |
					imageX := (x - (filter columnCount // 2) + filterX + image width) \\
								image width.
					imageY := (y - (filter rowCount // 2) + filterY + image height) \\
								image height.
					r := r + ((image colorAt: imageX@imageY) red *
								(filter at: filterY + 1 at: filterX + 1)).
					g := g + ((image colorAt: imageX@imageY) green *
								(filter at: filterY + 1 at: filterX + 1)).
					b := b + ((image colorAt: imageX@imageY) blue *
								(filter at: filterY + 1 at: filterX + 1))]].

			result colorAt: x@y put: (Color
				r: ((factor * r + bias) min: 1.0 max: 0.0)
				g: ((factor * g + bias) min: 1.0 max: 0.0)
				b: ((factor * b + bias) min: 1.0 max: 0.0))]].
	^ result
