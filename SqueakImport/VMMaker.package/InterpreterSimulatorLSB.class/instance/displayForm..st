debug support
displayForm: f
	| width height depth bits realForm simDisp realDisp |
	bits := objectMemory fetchPointer: 0 ofObject: f.
	width := self fetchInteger: 1 ofObject: f.
	height := self fetchInteger: 2 ofObject: f.
	depth := self fetchInteger: 3 ofObject: f.
	realForm := Form extent: width@height depth: depth.
	simDisp := Form new hackBits: objectMemory getMemory.
	realDisp := Form new hackBits: realForm bits.
	realDisp
		copy: (0 @ 0 extent: 4 @ realForm bits size)
		from: (0 @ (bits + 4 // 4))
		in: simDisp
		rule: Form over.
	realForm displayOn: Display at: 0@0.