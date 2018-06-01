dial drawing
buildDial
	"start by making a damn big Form, twice the size we want to end up with"
	|outerRadius destForm canvas tickLabel tickLength beginAngle endAngle tickAngle maxTicks |
	outerRadius := self height  - 1.
	destForm := Form extent: self extent * 2 depth: 32.
	(canvas := destForm getCanvas) fillOval: (0@0 extent: self extent * 2) color: Color white.
	"outer ring"
	self drawArcAt: destForm center radius: outerRadius thickness: 1 color: Color black beginAngle: 0 endAngle: 360 onForm: destForm.
	"inner ring"
	self drawArcAt: destForm center radius: outerRadius * 0.97 thickness: 1 color: Color black beginAngle: 0 endAngle: 360 onForm: destForm.
	
	"outer scale for degrees"
	beginAngle := startAngle . 
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.9 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.83 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.55 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	"We use a simple % range, just one scale"
	maxTicks := stopValue - startValue .
	tickAngle := endAngle - beginAngle / maxTicks.
	startValue to: stopValue do: [:tick|
	tickLength := outerRadius * 0.07.
		tickLabel := nil.
		tick \\ 2 = 0 ifTrue:["tick every 2 degrees on the outer ring"
			self drawTickRadius: outerRadius * 0.9 length: tickLength thickness: 2 color: Color black angle:  beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		].
		tick \\ 10 = 0 ifTrue: ["tick every 10 degrees on the inner ring"
			self drawTickRadius: outerRadius * 0.83 length: tickLength thickness: 2 color: Color black angle:  beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
			(tick \\ 30 = 0 and: [tick < 360]) ifTrue:["numbered ticks every 30 degrees, don't overwrite 0 with 360"
				self tickInnerLabel: tick asString fontSize: 24 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.75) + tickLength angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas
			]
		].
		(tick \\ 90 = 0 and: [tick < 360]) ifTrue:["Major cardianl at the full points"
			tickLabel := { 'N'. 'E'. 'S'. 'W'. nil.} atWrap: tick // 90 +1.
			self tickInnerLabel: tickLabel fontSize: 36 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.65) + tickLength angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas
		].
		(tick \\ 90 = 45 and: [tick < 360]) ifTrue:["minor cardinal at the half-points"
			tickLabel := { 'NE'. 'SE'. 'SW'. 'NW'. nil.} atWrap: tick // 90 +1.
			self tickInnerLabel: tickLabel fontSize: 30 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.48) + tickLength angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas
		]		
	].

	self addMorph: (destForm magnify: destForm boundingBox by: 0.5 smoothing: 2) asMorph