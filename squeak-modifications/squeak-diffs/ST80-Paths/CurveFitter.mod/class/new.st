instance creation
new

	| newSelf | 
	newSelf := super new: 3.
	newSelf add: 0@0.
	newSelf add: 0@0.
	newSelf add: 0@0.
	^newSelf