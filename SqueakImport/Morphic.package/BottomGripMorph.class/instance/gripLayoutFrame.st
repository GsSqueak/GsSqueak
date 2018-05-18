accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (0 @ 1 corner: 1 @ 1)
		offsets: (0 @ 0 negated corner: 0@ self defaultHeight)