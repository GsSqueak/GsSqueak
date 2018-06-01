actions & preps
star: evt 
	"Draw an star from the center."
	| poly ext ww rect oldExt oldRect oldR verts pt cColor sOrigin priorEvt |
	sOrigin := self get: #strokeOrigin for: evt.
	cColor := self getColorFor: evt.
	ww := (self getNibFor: evt) width.
	ext := (pt := sOrigin - evt cursorPoint) r + ww * 2.
	rect := Rectangle center: sOrigin extent: ext.
	(priorEvt := self get: #lastEvent for: evt)
		ifNotNil: [oldExt := (sOrigin - priorEvt cursorPoint) r + ww * 2.
			"Last draw sticks out, must erase the area"
			oldRect := Rectangle center: sOrigin extent: oldExt.
			self restoreRect: oldRect].
	ext := pt r.
	oldR := ext.
	verts := (0 to: 350 by: 36)
				collect: [:angle | (Point r: (oldR := oldR = ext
									ifTrue: [ext * 5 // 12]
									ifFalse: [ext]) degrees: angle + pt degrees)
						+ sOrigin].
	poly := PolygonMorph new addHandles.
	poly borderColor: (cColor isTransparent ifTrue: [Color black] ifFalse: [cColor]).
	poly borderWidth: (self getNibFor: evt) width.
	poly fillStyle: Color transparent.

	"can't handle thick brushes"
	self invalidRect: rect.
	"self addMorph: poly."
	poly privateOwner: self.
	poly
		bounds: (sOrigin extent: ext).
	poly setVertices: verts.
	poly drawOn: formCanvas.
	"poly delete."
	self invalidRect: rect