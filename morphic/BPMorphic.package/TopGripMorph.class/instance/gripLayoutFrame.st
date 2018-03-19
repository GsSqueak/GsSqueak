accessing
gripLayoutFrame
	^ LayoutFrame
		fractions: (0 @ 0 corner: 1 @ 0)
		offsets: (0 @ (-40 - self defaultHeight) corner: 0 @ 0)