bytecode decoding
pushNilCode
	"Answer the pushNil bytecode.
	112-119 01110iii Push (receiver, true, false, nil, -1, 0, 1, 2) [iii]"
	^ 115