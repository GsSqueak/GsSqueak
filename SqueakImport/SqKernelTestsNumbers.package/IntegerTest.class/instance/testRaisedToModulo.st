testing - arithmetic
testRaisedToModulo
	#(301 2047) do: [:m |
		1 to: m - 1 by: (m // 30) do: [:x |
			11 to: m - 1 by: (m // 40) do: [:y |
				self assert: (x raisedTo: y) \\ m = (x raisedTo: y modulo: m)]]].
	self assert: (8951195 raisedTo: 7742931 modulo: 15485863) = 15485862.