as yet unclassified
applyTo: aConsCell inLisp: aLisp
	aConsCell isNil ifTrue: [^ aLisp perform: selector with: aConsCell].
	^ aLisp
		perform: selector
		with: (aLisp evalList: aConsCell)
