examples
exampleLabelOnly
	"SystemProgressMorph exampleLabelOnly"
	| words |
	words := #(zero one two three four five six seven eight nine ten) reversed.
	UIManager default informUserDuring: [:bar |
		words do: [:each|
			bar value: 'Countdown: ', each.
			(Delay forSeconds: 1) wait]].