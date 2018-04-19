*SqCollectionLiterals-*SqCollectionLiterals-enumerating
combinations: kk atATimeDo: aBlock
	"Gather the combinations into a String rather than an Array"
	
	" 'abcde' combinations: 3 atATimeDo: [:each | Transcript cr; show: each printString]"

	| aCollection |
	aCollection := String new: kk.
	self combinationsAt: 1 in: aCollection after: 0 do: aBlock
