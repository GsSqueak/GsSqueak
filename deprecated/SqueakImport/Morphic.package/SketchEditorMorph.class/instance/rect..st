actions & preps
rect: evt 
	"While moving corner, just write on the canvas. When done, write on the paintingForm"

	| rect oldRect now diff cor cColor sOrigin priorEvt |
	sOrigin := self get: #strokeOrigin for: evt.
	rect := sOrigin rect: (now := evt cursorPoint).
	cColor := self getColorFor: evt.
	evt shiftPressed
		ifTrue: [diff := evt cursorPoint - sOrigin.
			now := sOrigin
						+ (Point r: (diff x abs min: diff y abs)
									* 2 degrees: diff degrees // 90 * 90 + 45).
			rect := sOrigin rect: now].
	(priorEvt := self get: #lastEvent for: evt) isNil
		ifFalse: [oldRect := sOrigin rect: priorEvt cursorPoint.
			priorEvt shiftPressed
				ifTrue: [diff := priorEvt cursorPoint - sOrigin.
					cor := sOrigin
								+ (Point r: (diff x abs min: diff y abs)
											* 2 degrees: diff degrees // 90 * 90 + 45).
					oldRect := sOrigin rect: cor].
		self restoreRect: oldRect].  		"Last draw will stick out, must erase the area"

	cColor == Color transparent
		ifTrue: [formCanvas
				frameAndFillRectangle: rect
				fillColor: Color transparent
				borderWidth: (self getNibFor: evt) width
				borderColor: Color black]
		ifFalse: [formCanvas
				frameAndFillRectangle: rect
				fillColor: Color transparent
				borderWidth: (self getNibFor: evt) width
				borderColor: cColor].
	self invalidRect: rect