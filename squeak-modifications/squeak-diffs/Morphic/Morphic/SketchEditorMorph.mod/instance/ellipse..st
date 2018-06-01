actions & preps
ellipse: evt
	"Draw an ellipse from the center. "

	| rect oldRect ww ext oldExt cColor sOrigin priorEvt |

	sOrigin := self get: #strokeOrigin for: evt.
	cColor := self getColorFor: evt.
	ext := (sOrigin - evt cursorPoint) abs * 2.
	evt shiftPressed ifTrue: [ext := self shiftConstrainPoint: ext].
	rect := Rectangle center: sOrigin extent: ext.
	ww := (self getNibFor: evt) width.
	(priorEvt := self get: #lastEvent for: evt) ifNotNil: [
		oldExt := (sOrigin - priorEvt cursorPoint) abs + ww * 2.
		priorEvt shiftPressed ifTrue: [oldExt := self shiftConstrainPoint: oldExt].
		(oldExt < ext) ifFalse: ["Last draw sticks out, must erase the area"
			oldRect := Rectangle center: sOrigin extent: oldExt.
			self restoreRect: oldRect]].
	cColor == Color transparent
		ifFalse:
			[formCanvas fillOval: rect color: Color transparent borderWidth: ww borderColor: cColor]
		ifTrue:
			[formCanvas fillOval: rect color: cColor borderWidth: ww borderColor: Color black].

	self invalidRect: rect.

