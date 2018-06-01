menu
changeEmphasis

	| reply aList |
	aList := #(normal bold italic narrow underlined struckOut).
	reply := UIManager default 
		chooseFrom: (aList collect: [:t | t translated]) 
		values: aList..
	reply ifNotNil:[
		self emphasis: (TextEmphasis perform: reply) emphasisCode.
	].
