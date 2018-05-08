private
evalList: aConsCell 
	^ (aConsCell
		ifNil: [^ nil])
		collect: [:v | self evalObject: v]
