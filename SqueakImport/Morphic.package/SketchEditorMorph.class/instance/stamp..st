actions & preps
stamp: evt
	"plop one copy of the user's chosen Form down."

	"Check depths"
	| pt sForm |

	sForm := self get: #stampForm for: evt.
	pt := evt cursorPoint - (sForm extent // 2).
	sForm displayOn: paintingForm 
		at: pt - bounds origin
		clippingBox: paintingForm boundingBox
		rule: Form paint
		fillColor: nil.
	self render: (pt extent: sForm extent).
