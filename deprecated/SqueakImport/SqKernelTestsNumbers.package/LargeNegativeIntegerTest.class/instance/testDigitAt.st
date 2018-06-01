tests
testDigitAt

	| lni |
	lni := -114605103402541699037609980192546360895434064385.
	1 to: 20 do: [:i | | digit |
		digit := lni digitAt: i.
		self assert: i equals: digit]
