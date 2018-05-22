e-toy support
flipVertical

	|  r |
	r := self rotationCenter.
	self top:  self top - (1.0 - (2 * r y) * self height).
	self form: (self form flipBy: #vertical centerAt: self form center).
	self rotationCenter:  r x @ (1 - r y).