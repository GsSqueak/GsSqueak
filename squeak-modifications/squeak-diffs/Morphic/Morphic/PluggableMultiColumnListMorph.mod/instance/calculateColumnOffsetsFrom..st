initialization
calculateColumnOffsetsFrom: maxWidths
	| offsets previous current |
	offsets := Array new: maxWidths size.
	1
		to: offsets size
		do: [:indx | offsets at: indx put: (maxWidths at: indx)
					+ 10].
	2
		to: offsets size
		do: [:indx | 
			previous := offsets at: indx - 1.
			current := offsets at: indx.
			current := previous + current.
			offsets at: indx put: current].
	^offsets
