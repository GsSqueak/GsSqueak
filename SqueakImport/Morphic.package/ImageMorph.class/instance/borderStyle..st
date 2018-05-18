accessing
borderStyle: newStyle
	| newExtent |
	newExtent := 2 * newStyle width + image extent.
	bounds extent = newExtent ifFalse:[super extent: newExtent].
	super borderStyle: newStyle.