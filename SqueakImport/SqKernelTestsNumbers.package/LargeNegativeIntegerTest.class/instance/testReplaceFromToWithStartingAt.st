tests
testReplaceFromToWithStartingAt

	| lni20 lni7 |
	lni20 := LargeNegativeInteger new: 20.
	1 to: 20 do: [:i | lni20 digitAt: i put: i].
	lni7 := LargeNegativeInteger new: 7.
	1 to: 7 do: [:i | lni7 digitAt: i put: 11 - i].
	lni20 replaceFrom: 6 to: 10 with: lni7 startingAt: 2.
	"unmodified digits"
	(1 to: 5) , (11 to: 20) do: [:e | | digit |
		digit := lni20 digitAt: e.
		self assert: e equals: digit].
	"replaced digits"
	6 to: 10 do: [:e | | digit replacementDigit |
		digit := lni20 digitAt: e.
		replacementDigit := lni7 digitAt: e - 4.
		self assert: replacementDigit equals: digit]
