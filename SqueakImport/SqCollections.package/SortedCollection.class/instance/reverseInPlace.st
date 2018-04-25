converting
reverseInPlace
	"Change this colleciton into its reversed.
	Do not make a copy like reversed do, but change self in place."
	
	| newFirstIndex |
	newFirstIndex := 1 + array size - lastIndex.
	lastIndex := 1 + array size - firstIndex.
	firstIndex := newFirstIndex.
	array := array reversed.
	sortBlock := sortBlock
		ifNil: [ [ :a :b | b <= a ] ]
		ifNotNil: [ [ :a :b | sortBlock value: b value: a ] ]