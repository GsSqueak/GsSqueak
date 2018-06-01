point functions
eightNeighbors
	^ (Array with: self + (1 @ 0)
		with: self + (1 @ 1)
		with: self + (0 @ 1)
		with: self + (-1 @ 1)) ,
	(Array with: self + (-1 @ 0)
		with: self + (-1 @ -1)
		with: self + (0 @ -1)
		with: self + (1 @ -1))
