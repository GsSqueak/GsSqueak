accessing
arguments

	^ Array new: self numArgs streamContents: [:args |
 		1 to: self numArgs do: [: i |
			args nextPut: (self tempAt: i)]]