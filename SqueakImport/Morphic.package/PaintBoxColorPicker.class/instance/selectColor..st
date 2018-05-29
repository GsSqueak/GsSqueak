event handling
selectColor: evt 
	"Update the receiver from the given event. Constrain locOfCurrent's center to lie within the color selection area. If it is partially in the transparent area, snap it entirely into it vertically."

	| r |

	locOfCurrent := evt cursorPoint - self topLeft.
	r := Rectangle center: locOfCurrent extent: 9 @ 9.
	locOfCurrent := locOfCurrent 
				+ (r amountToTranslateWithin: (8 @ 11 corner: (self image width-6) @ (self image height-6))).
	locOfCurrent x > (self image width-(12+7))  ifTrue: [locOfCurrent := (self image width - 12) @ locOfCurrent y].	"snap into grayscale"
	currentColor := locOfCurrent y < 19
				ifTrue:  
					[locOfCurrent := locOfCurrent x @ 11.	"snap into transparent"
					Color transparent]
				ifFalse: [image colorAt: locOfCurrent].
	(owner isKindOf: PaintBoxMorph) 
		ifTrue: [owner takeColorEvt: evt from: self].
	self changed