experimental
nthParent: aNumber 
	| env |
	env := self.
	aNumber isZero
		ifTrue: [^ env].
	1
		to: aNumber
		do: [:i | env := env parent].
	^ env