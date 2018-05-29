editing
acceptGraphPoint: p at: index 
	| ms val points whichLim linePoint other boundedP |
	boundedP := p adhereTo: graphArea bounds.
	ms := self msFromX: boundedP x.
	points := envelope points.
	ms := self 
				constrain: ms
				adjacentTo: index
				in: points.
	(index = 1 or: [(whichLim := limits indexOf: index) > 0]) 
		ifTrue: 
			["Limit points must not move laterally"

			ms := (points at: index) x].
	val := self valueFromY: boundedP y.
	points at: index put: ms @ val.
	linePoint := (self xFromMs: ms) @ (self yFromValue: val).
	(whichLim notNil and: [whichLim between: 1 and: 2]) 
		ifTrue: 
			["Loop start and loop end must be tied together"

			other := limits at: 3 - whichLim.	" 1 <--> 2 "
			points at: other put: (points at: other) x @ val.
			line verticesAt: other put: (line vertices at: other) x @ linePoint y].
	"Make sure envelope feels the change in points array..."
	envelope 
		setPoints: points
		loopStart: limits first
		loopEnd: (limits second).
	^linePoint