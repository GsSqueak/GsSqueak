accessing
at: index
	"Return the element (e.g., point) at the given index"
	^(super at: index * 2 - 1) @ (super at: index * 2)