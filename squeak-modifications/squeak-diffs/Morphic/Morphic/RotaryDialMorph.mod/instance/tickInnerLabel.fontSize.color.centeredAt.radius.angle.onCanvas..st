dial drawing
tickInnerLabel: aString fontSize: fSize color: aColor centeredAt: aPoint radius: radius angle: angle onCanvas: canvas
	"draw the label string centered on the point radius from the centre point, at the angle. Long strings will almost certainly cause problems"
	| cell font pos rads rho stringExtent f rot |
	aString ifNil: [^self].
	font := TextStyle default fontOfSize: fSize.
	"draw the string and rotate it; we flip the angle to keep the letters kinda-sorta the right way up to read easily"
	stringExtent := (StringMorph contents: aString font: font ) imageForm boundingBox extent.
	f := Form extent: stringExtent depth: 32.
	f getCanvas  drawString: aString in: (0@0 extent: stringExtent) font: font color: aColor.
	(angle \\ 360 between: 90.5 and: 269.5) ifTrue:[
		rot := angle - 180] ifFalse: [
		rot := angle ].
	f := f rotateBy: rot smoothing: 2.
	
	"the radius is reduced by a bit more than half the string height to fit it reasonably neatly inside the radius"
	rho := radius - (stringExtent y /1.7).
	rads := (90 - angle) degreesToRadians.
	cell := (rho * rads cos) rounded @ (rho * rads sin) rounded negated.
	pos := aPoint * 2 + cell - (f extent // 2).
	canvas translucentImage: f at: pos