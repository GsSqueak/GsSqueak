primitives-adding
primAddLineFrom: start to: end leftFillIndex: leftFillIndex rightFillIndex: rightFillIndex
	
	(self canProceedAfter: self primGetFailureReason) ifTrue:[
		^self primAddLineFrom: start to: end leftFillIndex: leftFillIndex rightFillIndex: rightFillIndex
	].
	^ 0