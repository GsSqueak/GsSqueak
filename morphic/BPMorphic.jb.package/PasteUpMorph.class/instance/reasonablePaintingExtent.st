painting
reasonablePaintingExtent	^ Preferences unlimitedPaintArea		ifTrue: [3000 @ 3000]		ifFalse: [Preferences defaultPaintingExtent]