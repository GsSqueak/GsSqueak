private
toggleRectangle

	| h |
	h := bounds height.
	^(bounds left + self hMargin + (12 * indentLevel)) @ bounds top extent: 12@h