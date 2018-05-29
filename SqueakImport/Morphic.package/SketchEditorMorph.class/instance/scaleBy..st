actions & preps
scaleBy: evt 
	"up-down is scale. 3/26/97 tk Now a slider on the right."
	| pt temp cy oldRect amt myBuff |

	myBuff := self get: #buff for: evt.
	pt := evt cursorPoint - bounds center.
	cy := bounds height * 0.5.
	oldRect := myBuff boundingBox expandBy: myBuff extent * cumMag / 2.
	amt := pt y abs < 12
				ifTrue: ["detent"
					1.0]
				ifFalse: [pt y - (12 * pt y abs // pt x)].
	amt := amt asFloat / cy + 1.0.
	temp := myBuff
				rotateBy: cumRot
				magnify: amt
				smoothing: 2.
	cumMag > amt
		ifTrue: ["shrinking"
			oldRect := oldRect translateBy: paintingForm center - oldRect center + myBuff offset.
			paintingForm
				fill: (oldRect expandBy: 1 @ 1)
				rule: Form over
				fillColor: Color transparent].
	temp displayOn: paintingForm at: paintingForm center - temp center + myBuff offset.
	scaleButton position: scaleButton position x @ (evt cursorPoint y - 6).
	self render: bounds.
	cumMag := amt