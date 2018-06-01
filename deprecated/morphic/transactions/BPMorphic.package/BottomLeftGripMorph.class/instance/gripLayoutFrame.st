accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (0 @ 1 corner: 0 @ 1)
		offsets: (self class gripThickness negated @ (self defaultHeight negated + self class gripThickness) corner: 0 @ 0)