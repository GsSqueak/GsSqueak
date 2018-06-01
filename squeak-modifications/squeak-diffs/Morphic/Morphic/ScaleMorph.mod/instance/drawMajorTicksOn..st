drawing
drawMajorTicksOn: aCanvas 
	| scale x1 y1 y2 y3 loopStart checkStart yoffset randomLabel even |
	scale := (self innerBounds width - 1) / (stop - start) asFloat.
	yoffset := majorTickLength < 0 
		ifTrue: [ majorTickLength abs + 1]
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
	y2 := y1 - majorTickLength.
	y3 := y1 - ((minorTickLength + majorTickLength) // 2).
	even := true.
	"Make sure major ticks start drawing on a multiple of majorTick"
	loopStart := (start / majorTick) ceiling * majorTick.
	checkStart := (start / (majorTick / 2.0)) ceiling * majorTick.
	"Check to see if semimajor tick should be drawn before majorTick"
	checkStart = (loopStart * 2) 
		ifFalse: 
			[loopStart := checkStart / 2.0.
			even := false].
	loopStart to: stop
		by: majorTick / 2.0
		do: 
			[:v | | yy x | 
			x := x1 + (scale * (v - start)).
			yy := even ifTrue: [y2] ifFalse: [y3].
			aCanvas 
				line: x @ y1
				to: x @ yy
				width: 1
				color: Color black.
			even := even not]