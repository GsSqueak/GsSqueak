tests
testDigitAtPut

	| lni |
	lni := LargeNegativeInteger new: 20.
	1 to: 20 do: [:i | lni digitAt: i put: i].
	self assert: -114605103402541699037609980192546360895434064385equals: lni
