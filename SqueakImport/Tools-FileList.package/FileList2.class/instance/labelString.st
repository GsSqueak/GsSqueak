initialization
labelString
	^ (directory ifNil: [^'[]']) pathName contractTo: 50