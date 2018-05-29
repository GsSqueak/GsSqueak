actions & preps
rotateBy: evt 
	"Left-right is rotation. 3/26/97 tk Slider at top of window. 4/3/97 tk"
	| pt temp amt smooth myBuff |

	myBuff := self get: #buff for: evt.
	evt cursorPoint x - self left < 20
		ifTrue: [^ self flipHoriz: evt].
	"at left end flip horizontal"
	evt cursorPoint x - self right > -20
		ifTrue: [^ self flipVert: evt].
	"at right end flip vertical"
	pt := evt cursorPoint - bounds center.
	smooth := 2.
	"paintingForm depth > 8 ifTrue: [2] ifFalse: [1]."
	"Could go back to 1 for speed"
	amt := pt x abs < 12
				ifTrue: ["detent"
					0]
				ifFalse: [pt x - (12 * pt x abs // pt x)].
	amt := amt * 1.8.
	temp := myBuff
				rotateBy: amt
				magnify: cumMag
				smoothing: smooth.
	temp displayOn: paintingForm at: paintingForm center - temp center + myBuff offset.
	rotationButton position: evt cursorPoint x - 6 @ rotationButton position y.
	self render: bounds.
	cumRot := amt