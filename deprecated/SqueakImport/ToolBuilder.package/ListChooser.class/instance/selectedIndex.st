accessing
selectedIndex
	^ selectedIndex ifNil: [ self items size min: 1 ]