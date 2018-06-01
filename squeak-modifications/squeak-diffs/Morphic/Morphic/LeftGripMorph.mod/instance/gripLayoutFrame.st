accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (0 @ 0 corner: 0 @ 1)
		offsets: (self defaultWidth negated @ 0 corner: 0 @ 0)