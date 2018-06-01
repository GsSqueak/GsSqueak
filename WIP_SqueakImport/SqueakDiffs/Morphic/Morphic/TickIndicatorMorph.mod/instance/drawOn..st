drawing
drawOn: aCanvas
	| r center cc deg |
	super drawOn: aCanvas.
	corners ifNil:[
		r := (bounds topCenter - bounds center) r - 2.
		corners := Array new: 32.
		1 to: corners size do:[:i|
			deg := 360.0 / corners size * (i-1).
			corners at: i put: (Point r: r degrees: deg-90) asIntegerPoint]].
	index := index \\ corners size.
	cc := color darker.
	center := bounds center.
	1 to: corners size by: 4 do:[:i|
		aCanvas fillRectangle: (center + (corners at: i)-2  extent: 4@4) color: cc.
	].
	cc := cc darker.
	aCanvas line: center to: center + (corners at: index + 1) width: 2 color: cc.