actions & preps
flipVert: evt 
	"Flip the image"
	| temp myBuff |

	myBuff := self get: #buff for: evt.
	temp := myBuff deepCopy flipBy: #vertical centerAt: myBuff center.
	temp offset: 0 @ 0.
	paintingForm fillWithColor: Color transparent.
	temp displayOn: paintingForm at: paintingForm center - myBuff center + myBuff offset.
	rotationButton position: evt cursorPoint x - 6 @ rotationButton position y.
	self render: bounds