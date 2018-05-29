drawing
drawMinorTicksOn: aCanvas 
	| scale x1 y1 y2 loopStart yoffset randomLabel |
	scale := (self innerBounds width - 1) / (stop - start) asFloat.
	yoffset := majorTickLength < 0 
				ifTrue: [majorTickLength abs + 1]
				ifFalse: [1]. 
	caption ifNotNil: 
			[captionAbove 
				ifFalse: 
					[randomLabel := StringMorph contents: 'Foo'.
					yoffset := yoffset + randomLabel height + 2]].
	tickPrintBlock ifNotNil: 
			[labelsAbove 
				ifFalse: 
					[randomLabel := StringMorph contents: '50'.
					yoffset := yoffset + randomLabel height + 2]].
	x1 := self innerBounds left.
	y1 := self innerBounds bottom - yoffset.
	y2 := y1 - minorTickLength.
	loopStart := (start / minorTick) ceiling * minorTick.
	loopStart to: stop
		by: minorTick
		do: 
			[:v | | x | 
			x := x1 + (scale * (v - start)).
			aCanvas 
				line: x @ y1
				to: x @ y2
				width: 1
				color: Color black]