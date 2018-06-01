actions & preps
rotateScalePrep: evt
	"Make a source that is the paintingForm.  Work from that.  3/26/97 tk"

	| newBox myBuff |

	(self getActionFor: evt) == #scaleOrRotate ifTrue: [^ self].	"Already doing it"
	paintingForm width > 120 
		ifTrue: [newBox := paintingForm rectangleEnclosingPixelsNotOfColor: Color transparent.
			"minimum size"
			newBox := newBox insetBy: 
				((18 - newBox width max: 0)//2) @ ((18 - newBox height max: 0)//2) * -1]
		ifFalse: [newBox := paintingForm boundingBox].
	newBox := newBox expandBy: 1.
	self set: #buff for: evt to: (myBuff := Form extent: newBox extent depth: paintingForm depth).
	myBuff offset: newBox center - paintingForm center.
	myBuff copyBits: newBox from: paintingForm at: 0@0 
		clippingBox: myBuff boundingBox rule: Form over fillColor: nil.
	"Could just run up owner chain asking colorUsed, but may not be embedded"
	cumRot := 0.0.  cumMag := 1.0.	"start over"
	self set: #changed for: evt to: true.
	self set: #action for: evt to: #scaleOrRotate.
		"Only changed by mouseDown with tool in paint area"