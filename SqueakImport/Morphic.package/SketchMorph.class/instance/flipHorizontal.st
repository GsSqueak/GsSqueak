e-toy support
flipHorizontal

	|  r |
	r := self rotationCenter.
	self left:  self left - (1.0 - (2 * r x) * self width).
	self form: (self form flipBy: #horizontal centerAt: self form center).
	self rotationCenter: (1 - r x) @ (r y).