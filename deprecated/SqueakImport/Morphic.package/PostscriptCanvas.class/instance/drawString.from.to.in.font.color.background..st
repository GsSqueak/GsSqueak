drawing-text
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c background: b
	target preserveStateDuring: [ :t | self fillRectangle: boundsRect color: b ].
	self drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c 