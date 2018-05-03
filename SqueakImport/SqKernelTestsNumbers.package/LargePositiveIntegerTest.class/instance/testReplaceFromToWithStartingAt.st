tests
testReplaceFromToWithStartingAt

	| lpi20 lpi7 |
	lpi20 := LargePositiveInteger new: 20.
	1 to: 20 do: [:i | lpi20 digitAt: i put: i].
	lpi7 := LargePositiveInteger new: 7.
	1 to: 7 do: [:i | lpi7 digitAt: i put: 11 - i].
	lpi20 replaceFrom: 6 to: 10 with: lpi7 startingAt: 2.
	"unmodified digits"
	(1 to: 5) , (11 to: 20) do: [:e | | digit |
		digit := lpi20 digitAt: e.
		self assert: e equals: digit].
	"replaced digits"
	6 to: 10 do: [:e | | digit replacementDigit |
		digit := lpi20 digitAt: e.
		replacementDigit := lpi7 digitAt: e - 4.
		self assert: replacementDigit equals: digit]
