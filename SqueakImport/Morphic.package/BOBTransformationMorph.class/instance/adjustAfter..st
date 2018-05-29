private
adjustAfter: changeBlock 
	"Cause this morph to remain cetered where it was before, and
	choose appropriate smoothing, after a change of scale or rotation."
	| |

		"oldRefPos := self referencePosition."
	changeBlock value.
	self chooseSmoothing.
		"self penUpWhile: [self position: self position + (oldRefPos - self referencePosition)]."
	self layoutChanged.
	owner ifNotNil: [owner invalidRect: bounds]
