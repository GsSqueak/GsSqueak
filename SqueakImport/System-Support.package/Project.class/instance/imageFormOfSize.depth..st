displaying
imageFormOfSize: extentPoint depth: d
	| newDisplay |
	newDisplay := DisplayScreen extent: extentPoint depth: d.
	Display replacedBy: newDisplay do:[self invalidate; restore].
	^newDisplay