private
adjustAfter: changeBlock 

	"same as super, but without reference position stuff"

	changeBlock value.
	self chooseSmoothing.
	self layoutChanged.
	owner ifNotNil: [owner invalidRect: bounds]
