transforming
selfHaltNode
	| dummy |
	dummy := Parser new
		parse: 'self halt.'
		class: self class
		noPattern: true
		notifying: nil ifFail: [^nil].
	
	^ dummy block statements first expr.
