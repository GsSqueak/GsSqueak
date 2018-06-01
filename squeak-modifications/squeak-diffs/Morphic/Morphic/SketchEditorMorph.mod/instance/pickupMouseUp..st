actions & preps
pickupMouseUp: evt 
	"Grab a part of the picture (or screen) and store it in a known place. Like Copy on the Mac menu. Then switch to the stamp tool."

	| rr pForm ii oldRect sOrigin priorEvt |
	sOrigin := self get: #strokeOrigin for: evt.
	(priorEvt := self get: #lastEvent for: evt) isNil 
		ifFalse: 
			["Last draw will stick out, must erase the area"

			oldRect := sOrigin rect: priorEvt cursorPoint + (14 @ 14).
			self restoreRect: (oldRect insetBy: -2)].
	self primaryHand showTemporaryCursor: nil.	"later get rid of this"
	rr := sOrigin rect: evt cursorPoint + (14 @ 14).
	ii := rr translateBy: 0 @ 0 - bounds origin.
	(rr intersects: bounds) 
		ifTrue: 
			[pForm := paintingForm copy: ii.
			pForm isAllWhite 
				ifFalse: 
					["means transparent"

					"normal case.  Can be transparent in parts"

					]
				ifTrue: 
					[pForm := nil
					"Get an un-dimmed picture of other objects on the playfield"
					"don't know how yet"]].
	pForm ifNil: [pForm := Form fromDisplay: rr].	"Anywhere on the screen"
	palette pickupForm: pForm evt: evt.
	evt hand showTemporaryCursor: (self getCursorFor: evt)