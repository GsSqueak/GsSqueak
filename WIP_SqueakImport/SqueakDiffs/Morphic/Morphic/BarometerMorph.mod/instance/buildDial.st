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
	
	"outer scale for inches of HG"
	beginAngle := startAngle -360. "needs cleaning up about this"
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.8 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.73 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	"since we're going from 28in. to 31in. of Hg for the outer scale and want alternating full and half ticks as we go round we need 31-28 * 10 * 2 -> 60 ticks"
	maxTicks := 31 - 28 * 10 * 2.
	tickAngle := endAngle - beginAngle / maxTicks.
	0 to: maxTicks do: [:tick|
		tickLabel := nil.
		tickLength := {outerRadius * 0.07. outerRadius * 0.14} atWrap: tick+1.
		tick \\ 20 = 0 ifTrue: [
			tickLabel := #( '28' '29' '30' '31') at: tick // 20 + 1.
			tickLabelSize := 24.
		] ifFalse: [
			tick \\ 2 = 0 ifTrue: [
				tickLabel :=  (tick // 2 \\ 10) asString.
				tickLabelSize := 18.
			].
		].
		self drawTickRadius: outerRadius * 0.73 length: tickLength thickness: 2 color: Color black angle:  beginAngle + (tick * tickAngle) onCanvas: canvas.
		self tickLabel: tickLabel fontSize: tickLabelSize color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) + tickLength angle: beginAngle + (tick * tickAngle) onCanvas: canvas.
	].

	self tickInnerLabel: 'mB' fontSize: 36 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) angle: 180 onCanvas: canvas.

	"inner scale for mB"
	beginAngle := startAngle -360. "needs cleaning up about this"
	endAngle := stopAngle.
	
	self drawArcAt: destForm center radius: outerRadius * 0.71 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	self drawArcAt: destForm center radius: outerRadius * 0.63 thickness: 1 color: Color black beginAngle:beginAngle endAngle: stopAngle onForm: destForm.
	"since we're going from 948mB to 1050 for this inner scale and want thick ticks at each 10mB interval with narrow ones elsewhere we have (1050 - 948) total ticks "
	maxTicks := stopValue - startValue.
	tickAngle := endAngle - beginAngle / maxTicks.
	tickLength := outerRadius * 0.07.
	startValue to: stopValue do: [ :tick ||tickThickness|
		tickLabel := nil.
		tick \\ 10 = 0 ifTrue: [
			tickLabelSize := 20.
			tickThickness := 3.
			tickLabel :=  tick asString.
		] ifFalse: [
			tickThickness := 2.
		].
		self drawTickRadius: outerRadius * 0.63 length: tickLength thickness: tickThickness color: Color black angle:  beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		self tickInnerLabel: tickLabel fontSize: tickLabelSize color: Color black centeredAt: dialCenter radius: (outerRadius * 0.63) angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		tickLabel := nil.
		tick = 970 ifTrue:[tickLabel := 'Rain'].
		tick = 1000 ifTrue:[tickLabel := 'Change'].
		tick = 1030 ifTrue:[tickLabel := 'Fair'].
		self tickInnerLabel: tickLabel fontSize: 24 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.5) angle: beginAngle + (tick - startValue * tickAngle) onCanvas: canvas.
		
	].
	self tickLabel: '"Hg'  fontSize: 36 color: Color black centeredAt: dialCenter radius: (outerRadius * 0.73) angle: 180 onCanvas: canvas.
	
	self addMorph: (destForm magnify: destForm boundingBox by: 0.5 smoothing: 2) asMorph