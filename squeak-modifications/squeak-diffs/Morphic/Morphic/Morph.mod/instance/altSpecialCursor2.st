debug and other
altSpecialCursor2
	| f |
	"a blue box with transparent center"
	f := Form extent: 32@32 depth: 32.
	f offset: (f extent // 2) negated.
	f fill: f boundingBox rule: Form over fillColor: (Color blue alpha: 0.5).
	f fill: (f boundingBox insetBy: 4) rule: Form over fillColor: Color transparent.
	^f
