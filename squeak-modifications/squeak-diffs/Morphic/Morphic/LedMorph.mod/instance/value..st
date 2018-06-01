accessing
value: aNumber

	| val |
	value := aNumber.
	val := value.
	submorphs reverseDo:
		[:m |
		m digit: val \\ 10.
		val := val // 10].
	self changed.