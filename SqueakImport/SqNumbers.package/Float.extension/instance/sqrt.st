*SqNumbers-mathematical functions
sqrt
	self <= 0.0
		ifTrue: [self = 0.0
				ifTrue: [^ 0.0]
				ifFalse: ["v Chg"
					^ DomainError signal: 'sqrt undefined for number less than zero.']].
	^ self env0perf: #'sqrt'