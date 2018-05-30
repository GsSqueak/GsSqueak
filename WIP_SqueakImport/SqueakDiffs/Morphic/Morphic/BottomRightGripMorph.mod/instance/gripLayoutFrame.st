accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (1 @ 1 corner: 1 @ 1)
		offsets: ((self defaultWidth negated + self class gripThickness) @ (self defaultHeight negated + self class gripThickness)
			corner: 0@0)