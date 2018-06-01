dial drawing
buildDial
	"attempt a plausible default dial"
	|outerRadius destForm canvas tickLabel tickLength beginAngle endAngle tickAngle tickLabelSize maxTicks |
	outerRadius := self height  - 1.
	destForm := Form extent: self extent * 2 depth: 32.
	(canvas := destForm getCanvas) fillOval: (0@0 extent: self extent * 2) color: Color white.
	"outer ring"
	self drawArcAt: destForm center radius: outerRadius thickness: 1 color: Color black beginAngle: 0 endAngle: 360 onForm: destForm.
	
	beginAngle := startAngle -360. "needs cleaning up about this"
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.8 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.73 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	"Since this is a wild-guess default we'll try having 1 tick per integer value"
	maxTicks := stopValue - startValue.
	tickAngle := endAngle - beginAngle / maxTicks.
		tickLength := outerRadius * 0.07.
	startValue to: stopValue do: [:tick|
		tickLabel := nil.
		tickLabel := tick asString.
		tickLabelSize := 24.
		self drawTickRadius: outerRadius * 0.73 length: tickLength thickness: 2 color: Color black angle:  beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		"self tickLabel1."
		self tickLabel: tickLabel fontSize: tickLabelSize color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) + tickLength angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
	].

	self addMorph: (destForm magnify: destForm boundingBox by: 0.5 smoothing: 2) asMorph