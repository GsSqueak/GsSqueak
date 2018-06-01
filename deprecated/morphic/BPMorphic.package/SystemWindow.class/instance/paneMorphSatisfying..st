panes
paneMorphSatisfying: aBlock 
	^ paneMorphs
		detect: aBlock
		ifNone: []