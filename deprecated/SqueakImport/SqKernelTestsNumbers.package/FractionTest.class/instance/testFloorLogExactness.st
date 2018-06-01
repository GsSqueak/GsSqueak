tests - mathematical functions
testFloorLogExactness

	1 + (Float fminDenormalized floorLog: 10) to: -1 do: [:n |
		self assert: ((10 raisedTo: n) floorLog: 10) = n].

	"Float version is not exact for at least 2 reasons:
	1/(10 raisedTo: n) asFloat is not exact
	(aFloat log: radix) is not exact

	(1 + (Float fminDenormalized floorLog: 10) to: -1) count: [:n |
		((10 raisedTo: n) asFloat floorLog: 10) ~= n]."
	