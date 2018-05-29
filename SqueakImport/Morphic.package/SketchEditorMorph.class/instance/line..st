actions & preps
line: evt 
	"Draw a line on the paintingForm using formCanvas aimed at it."
	| rect oldRect ww now diff cor cColor sOrigin priorEvt |
	sOrigin := self get: #strokeOrigin for: evt.
	rect := sOrigin rect: (now := evt cursorPoint).
	evt shiftPressed
		ifTrue: [diff := evt cursorPoint - sOrigin.
			now := sOrigin
						+ (Point r: diff r degrees: diff degrees + 22.5 // 45 * 45).
			rect := sOrigin rect: now].
	ww := (self getNibFor: evt) width.
	(priorEvt := self get: #lastEvent for: evt)
		ifNotNil: [oldRect := sOrigin rect: priorEvt cursorPoint.
			priorEvt shiftPressed
				ifTrue: [diff := priorEvt cursorPoint - sOrigin.
					cor := sOrigin
								+ (Point r: diff r degrees: diff degrees + 22.5 // 45 * 45).
					oldRect := sOrigin rect: cor].
			oldRect := oldRect expandBy: ww @ ww.
			"Last draw will always stick out, must erase the area"
			self restoreRect: oldRect].
	cColor := self getColorFor: evt.
	formCanvas
		line: sOrigin
		to: now
		width: ww
		color: cColor.
	self invalidRect: rect