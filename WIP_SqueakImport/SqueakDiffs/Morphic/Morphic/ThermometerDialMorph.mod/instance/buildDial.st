dial drawing
buildDial
	"start by making a damn big Form, twice the size we want to end up with"
	|outerRadius destForm canvas tickLabel tickLength beginAngle endAngle tickAngle tickLabelSize maxTicks |
	outerRadius := self height  - 1.
	destForm := Form extent: self extent * 2 depth: 32.
	(canvas := destForm getCanvas) fillOval: (0@0 extent: self extent * 2) color: Color white.
	"outer ring"
	self drawArcAt: destForm center radius: outerRadius thickness: 1 color: Color black beginAngle: 0 endAngle: 360 onForm: destForm.
	"inner ring"
	self drawArcAt: destForm center radius: outerRadius * 0.97 thickness: 1 color: Color black beginAngle: 0 endAngle: 360 onForm: destForm.
	
	"outer scale for Fahrenheit"
	beginAngle := startAngle -360. "needs cleaning up about this"
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.8 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.73 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.

	maxTicks := stopValue - startValue  / 5 * 9 .
	tickAngle := endAngle - beginAngle / maxTicks.
	(startValue / 5 * 9 +32) to: (stopValue / 5 * 9 +32) do: [:tick|
	tickLength := outerRadius * 0.07.
		tickLabel := nil.
		tick \\ 10 = 0 ifTrue: [
			tickLabel := tick asString.
			tickLabelSize := 24
		] ifFalse: [
			tick \\ 2 = 0 ifTrue:[
				tickLabel := (tick \\ 10) asString.
				tickLabelSize := 18
			] ifFalse: [
				tickLength := tickLength * 2
			]
		].
		self drawTickRadius: outerRadius * 0.73 length: tickLength thickness: 2 color: Color black angle:  beginAngle + (tick - (startValue / 5 * 9 +32) * tickAngle) onCanvas: canvas.
		self tickLabel: tickLabel fontSize: tickLabelSize color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) + tickLength angle: beginAngle + (tick - (startValue / 5 * 9 +32) * tickAngle) onCanvas: canvas.
	].

	self tickInnerLabel: (String with: (Unicode value: 16rB0) with: $C) fontSize: 36 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) angle: 180 onCanvas: canvas.
	
	"inner scale for Celsius"
	beginAngle := startAngle -360. "needs cleaning up about this"
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.71 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.63 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	maxTicks := stopValue - startValue.
	tickAngle := endAngle - beginAngle / maxTicks.
	tickLength := outerRadius * 0.07.
	startValue to: stopValue do: [ :tick ||tickThickness|
		tickLabel := nil.
		tick \\ 5 = 0 ifTrue: [
			tickLabelSize := 20.
			tickThickness := 3.
			tickLabel :=  tick asString.
		] ifFalse: [
			tickThickness := 2.
		].
		self drawTickRadius: outerRadius * 0.63 length: tickLength thickness: tickThickness color: Color black angle:  beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		self tickInnerLabel: tickLabel fontSize: tickLabelSize color: Color black centeredAt: dialCenter radius: (outerRadius * 0.63) angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.

	].

	self tickLabel: (String with: (Unicode value: 16rB0) with: $F)  fontSize: 36 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) angle: 180 onCanvas: canvas.
	
	self addMorph: (destForm magnify: destForm boundingBox by: 0.5 smoothing: 2) asMorph