tests - mathematical functions
testFloorLogExactness
	1 + (Float fminDenormalized floorLog: 10) to: (Float fmax floorLog: 10) do: [:n |
		self assert: ((10 raisedTo: n) asScaledDecimal floorLog: 10) = n description: 'floorLog should be exact for ScaledDecimals'.]