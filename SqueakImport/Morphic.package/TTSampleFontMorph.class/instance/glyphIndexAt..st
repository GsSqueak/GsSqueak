connectors
glyphIndexAt: position
	| offset |
	offset := (position adhereTo: (bounds insetBy: 1)) - bounds origin.
	offset := (offset asFloatPoint / bounds extent) * 16.
	offset := offset truncated.
	^offset y * 16 + offset x