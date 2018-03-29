debug printing
printUnbalancedStack: primIdx 
	self print: 'Stack unbalanced after '.
	self successful
		ifTrue: [self print: 'successful primitive ']
		ifFalse: [self print: 'failed primitive '].
	self printNum: primIdx.
	self cr