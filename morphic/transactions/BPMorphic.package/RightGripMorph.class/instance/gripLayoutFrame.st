accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (1 @ 0 corner: 1 @ 1)
		offsets: (0 @ self defaultHeight negated corner: self defaultWidth @ 0)