private
generateStates
	"Generate untempered numbers into the states variable. Split up the operation into three parts to avoid the use of #atWrap: for accessing the states array. Optimized for SmallInteger operations."

	| i limit y offset |
	"Part 1"
	i := 0.
	offset := MTm.
	limit := MTn - offset.
	[ (i := i + 1) <= limit ] whileTrue: [
		y := (MTupperMask bitAnd: (states at: i)) bitOr: (MTlowerMask bitAnd: (states at: i + 1)).
		states
			at: i
			put: ((y bitAnd: 1) * MTa bitXor: ((states at: i + offset) bitXor: (y bitShift: -1))) ].
	"Part 2"
	limit := MTn - 1.
	offset := MTm - MTn.
	i := i - 1.
	[ (i := i + 1) <= limit ] whileTrue: [
		y := (MTupperMask bitAnd: (states at: i)) bitOr: (MTlowerMask bitAnd: (states at: i + 1)).
		states
			at: i
			put: ((y bitAnd: 1) * MTa bitXor: ((states at: i + offset) bitXor: (y bitShift: -1))) ].
	"Part 3"
	y := (MTupperMask bitAnd: (states at: MTn)) bitOr: (MTlowerMask bitAnd: (states at: 1)).
	states
		at: MTn
		put: ((y bitAnd: 1) * MTa bitXor: ((states at: MTm) bitXor: (y bitShift: -1))).
	index := 1
	