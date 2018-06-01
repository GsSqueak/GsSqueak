drawing
buildLabels
	| scale x1 y1 y2 captionMorph loopStart offset |
	majorTickLength * minorTickLength < 0 
		ifTrue: [minorTickLength := 0 - minorTickLength].
	self removeAllMorphs.
	caption ifNotNil: 
			[captionMorph := StringMorph contents: caption.
			offset := captionAbove 
				ifTrue: [majorTickLength abs + captionMorph height + 7]
				ifFalse: [2].
			captionMorph align: captionMorph bounds bottomCenter
				with: self bounds bottomCenter - (0 @ offset).
			self addMorph: captionMorph].
	tickPrintBlock ifNotNil: 
			["Calculate the offset for the labels, depending on whether or not 
			  1) there's a caption   
			below, 2) the labels are above or below the ticks, and 3) the   
			ticks go up or down"

			offset := labelsAbove 
						ifTrue: [majorTickLength abs + minorTickLength abs + 2]
						ifFalse: [2].
			caption 
				ifNotNil: [captionAbove ifFalse: [offset := offset + captionMorph height + 2]].
			scale := (self innerBounds width - 1) / (stop - start) asFloat.
			x1 := self innerBounds left.
			y1 := self innerBounds bottom.
			y2 := y1 - offset.
			"Start loop on multiple of majorTick"
			loopStart := (start / majorTick) ceiling * majorTick.
			loopStart to: stop
				by: majorTick
				do: 
					[:v | | x tickMorph | 
					x := x1 + (scale * (v - start)).
					tickMorph := StringMorph contents: (tickPrintBlock value: v).
					tickMorph align: tickMorph bounds bottomCenter with: x @ y2.
					tickMorph left < self left 
						ifTrue: [tickMorph position: self left @ tickMorph top].
					tickMorph right > self right 
						ifTrue: [tickMorph position: (self right - tickMorph width) @ tickMorph top].
					self addMorph: tickMorph]]