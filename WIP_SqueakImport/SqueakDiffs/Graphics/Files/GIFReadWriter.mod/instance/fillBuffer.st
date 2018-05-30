private-packing
fillBuffer
	| packSize |
	packSize := self next.
	bufStream := ReadStream on: (self next: packSize)