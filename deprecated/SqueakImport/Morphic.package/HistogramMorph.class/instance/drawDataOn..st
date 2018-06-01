drawing
drawDataOn: aCanvas

	| numX elementWidth offsetX font fontHeight offsetY maxY barWidth barRadius chartHeight |
	font := TextStyle defaultFont.
	fontHeight := font height.
	numX := self limit.
	maxY := self sum.
	elementWidth := self width / (numX + 1).
	barWidth := 2 max: (elementWidth * 0.9) floor.
	barRadius := barWidth / 2.
	offsetX := elementWidth / 2.
	offsetY := fontHeight * 1.2
		max: (self values collect: [:value | font widthOfString: (self labelFor: value)]) max.
	chartHeight := self height - offsetY.

	0 to: (self height - offsetY) by: 20 do: [:i |
	aCanvas
		line: 0@i to: aCanvas clipRect width@i width: 1 color: (Color lightGray lighter alpha: 0.5)].
	
	self valuesAndCountsWithIndexDo: 
		[:value :count :barIndex | | barMidX origin end  |
		barIndex <= self limit ifTrue: [
			barMidX := barIndex * elementWidth.
			origin := barMidX - barRadius @ ((maxY - count) / maxY * chartHeight).
			end := barMidX + barRadius @ chartHeight.

			self
				drawBar: (origin corner: end)  
				value: value
				count: count
				chartHeight: chartHeight
				font: font
				on: aCanvas]].
