initialization
defaultBounds
"answer the default bounds for the receiver"
	^ 0 @ 0 corner: 128 @ 128 + (self defaultBorderWidth * 2)