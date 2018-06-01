selection
selectionRectsFrom: characterBlock1 to: characterBlock2
	"Return an array of rectangles encompassing the area
	between the two character blocks, presumably a selection."
	| rects |
	rects := OrderedCollection new.
	self textSegmentsDo:
		[:line :destRect :segStart :segAngle |
		(characterBlock1 stringIndex <= line last
			and: [characterBlock2 stringIndex >= line first]) ifTrue:
			[rects addLast: destRect].
		line first > characterBlock2 stringIndex ifTrue:
			[^ rects]].
	^ rects