class changed shape
catalogValues: instVarList size: varsOnDisk
	"Create a dictionary of (name -> value) for the inst vars of this reshaped object.  Indexed vars as (1 -> val) etc.  "

	| dict sz |
	dict := Dictionary new.
	2 to: instVarList size do: [:ind |
		dict at: (instVarList at: ind) put: self next].
	sz := varsOnDisk - (instVarList size - 1).
	1 to: sz do: [:ii | 
		dict at: ii put: self next].
	"Total number read MUST be equal to varsOnDisk!"
	sz > 0 ifTrue: [dict at: #SizeOfVariablePart put: sz].
	^ dict