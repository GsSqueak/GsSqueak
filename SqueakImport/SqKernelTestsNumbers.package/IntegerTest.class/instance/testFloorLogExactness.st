tests - mathematical functions
testFloorLogExactness

	1 to: (Float fmax floorLog: 10) do: [:n |
		self assert: ((10 raisedTo: n) floorLog: 10) = n].

	"Float version is not exact for at least 2 reasons:
	(10 raisedTo: n) asFloat is not exact for n > 22
	(aFloat log: radix) is not exact

	(1 to: (Float fmax floorLog: 10)) count: [:n |
		((10 raisedTo: n) asFloat floorLog: 10) ~= n]."