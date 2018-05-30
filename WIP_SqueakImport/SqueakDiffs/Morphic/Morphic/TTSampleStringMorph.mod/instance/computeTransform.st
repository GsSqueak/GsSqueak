private
computeTransform
	| cy |
	cy := bounds origin y + bounds corner y * 0.5.
	transform := MatrixTransform2x3 
			transformFromLocal: (ttBounds insetBy: borderWidth negated)
			toGlobal: bounds.
	transform := transform composedWithGlobal:(MatrixTransform2x3 withOffset: 0 @ cy negated).
	transform := transform composedWithGlobal:(MatrixTransform2x3 withScale: 1.0 @ -1.0).
	transform := transform composedWithGlobal:(MatrixTransform2x3 withOffset: 0 @ cy).
	^transform