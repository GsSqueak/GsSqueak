filler text
symbolSample

	^ self streamContents: [:stream | | lineLength character|
		lineLength := 0.
		33 to: 255 do:[ :index |
			character := stream nextPut: (Character value: index).
			lineLength := lineLength + 1.
			(('@Z`z' includes: character) or: [lineLength >= 30]) 
				ifTrue: [
					lineLength :=0.
					stream cr]]]