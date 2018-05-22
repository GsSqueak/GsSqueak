access
contentsOfEntireFile
	| contents |
	self position: 0.
	contents := self next: self size.
	self close.
	^ contents