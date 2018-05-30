*Morphic-fliprotate
flipRotated: flipIndex 
	"Answer a copy of the receiver with element order indicated by  
	flipIndex."
	"Examples:"
	"'frog' flipRotated: 1"
	"[ :c | (1 to: c size * 2) collect:  
	[ :i | c flipRotated: i ]  
	] value: 'frog'."
	"Lsb of flipIndex indicates whether list is reversed"
	"The flipIndex // 2 gives how much to rotate by after reversing"
	"A good way to think of this is a piece of pie in a pie plate being flip  
	over its leading edge successively."
	"flipIndex > 2 * n are allowed to make it possible to store an array of  
	indexes in an integer."
	| n result src twist |
	n := self size.
	flipIndex \\ (n * 2) = 0
		ifTrue: [^ self].
	"allow for doing nothing"
	result := self species new: n.
	twist := flipIndex // 2 \\ n.
	src := 0.
	(flipIndex even
		ifTrue: [1 + twist to: n + twist]
		ifFalse: [n - 1 - twist to: twist negated by: -1])
		do: [:i | result
				at: (src := src + 1)
				put: (self atWrap: i)].
	^ result