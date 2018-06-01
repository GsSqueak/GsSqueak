dial drawing
tickLabel: aString fontSize: fSize color: aColor centeredAt: aPoint radius: radius angle: angle onCanvas: canvas
	"draw the label string unrotated outside the radius centered on the centre point. We try to get the center of the string bounds on the relevant point but it may look odd for certain strings"
	| cell font pos rads rho stringExtent |
	aString ifNil: [^self].
	
	font := TextStyle default fontOfSize: fSize.
	stringExtent := (StringMorph contents: aString font: font ) imageForm boundingBox extent.
	rho := radius + (stringExtent r /2).
	rads := (90 - angle) degreesToRadians.
	cell := (rho * rads cos) rounded @ (rho * rads sin) rounded negated.
	pos := aPoint * 2 + cell - (stringExtent // 2).
	canvas drawString: aString in: (pos extent: stringExtent) font: font color: aColor