writing
nextPutImage: aForm
	aForm unhibernate.
	aForm depth	 caseOf: {
		[1] 		-> [self nextPutBW: aForm reverse: false].
		[16] 	-> [self nextPutRGB: aForm].
		[32] 	-> [self nextPutRGB: aForm].
	} otherwise: [
		(aForm respondsTo: #colors) ifTrue:[
			aForm colors ifNil: [
				self nextPutGray: aForm
			]
			ifNotNil: [
				self nextPutRGB: aForm
			]
		]
		ifFalse:[
			self nextPutGray: aForm
		]
	]